// Copyright (c) 2013, SmugMug, Inc. All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
// 
// THIS SOFTWARE IS PROVIDED BY SMUGMUG, INC. ``AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SMUGMUG, INC. BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
// GOODS OR SERVICES;LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
// IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// The core configuration of the http proxy.
package bbpd_route

import (
	"time"
	"errors"
	"encoding/json"
	"net"
	"net/http"
	"fmt"
	"strings"
	"strconv"
	"log/syslog"
	"github.com/smugmug/bbpd/lib/bbpd_const"
	"github.com/smugmug/godynamo/aws_const"
	desc "github.com/smugmug/godynamo/endpoints/describe_table"
	"github.com/smugmug/bbpd/lib/describe_table_route"
	list "github.com/smugmug/godynamo/endpoints/list_tables"
	"github.com/smugmug/bbpd/lib/list_tables_route"
	create "github.com/smugmug/godynamo/endpoints/create_table"
	"github.com/smugmug/bbpd/lib/create_table_route"
	update_table "github.com/smugmug/godynamo/endpoints/update_table"
	"github.com/smugmug/bbpd/lib/update_table_route"
	put "github.com/smugmug/godynamo/endpoints/put_item"
	"github.com/smugmug/bbpd/lib/put_item_route"
	get "github.com/smugmug/godynamo/endpoints/get_item"
	"github.com/smugmug/bbpd/lib/get_item_route"
	bgi "github.com/smugmug/godynamo/endpoints/batch_get_item"
	"github.com/smugmug/bbpd/lib/batch_get_item_route"
	bwi "github.com/smugmug/godynamo/endpoints/batch_write_item"
	"github.com/smugmug/bbpd/lib/batch_write_item_route"
	delete_item "github.com/smugmug/godynamo/endpoints/delete_item"
	"github.com/smugmug/bbpd/lib/delete_item_route"
	update_item "github.com/smugmug/godynamo/endpoints/update_item"
	"github.com/smugmug/bbpd/lib/update_item_route"
	query "github.com/smugmug/godynamo/endpoints/query"
	"github.com/smugmug/bbpd/lib/query_route"
	scan "github.com/smugmug/godynamo/endpoints/scan"
	"github.com/smugmug/bbpd/lib/scan_route"
	"github.com/smugmug/bbpd/lib/raw_post_route"
	"github.com/smugmug/bbpd/lib/route_response"
	"github.com/smugmug/bbpd/lib/bbpd_runinfo"
	"github.com/bradclawsie/slog"

	delete_table "github.com/smugmug/godynamo/endpoints/delete_table"
	// undelete to enable table deletions (dangerous!)
	// "github.com/smugmug/bbpd/lib/delete_table_route"
)

const (
	LOCALHOST		= "localhost"

	STATUSPATH		= "/Status"
	STATUSTABLEPATH		= "/StatusTable/"
	RAWPOSTPATH		= "/RawPost/"
	DESCRIBETABLEPATH	= "/" + desc.ENDPOINT_NAME
	DESCRIBETABLEGETPATH	= "/" + desc.ENDPOINT_NAME + "/"
	DELETETABLEPATH		= "/" + delete_table.ENDPOINT_NAME
	DELETETABLEGETPATH	= "/" + delete_table.ENDPOINT_NAME + "/"
	LISTTABLESPATH		= "/" + list.ENDPOINT_NAME
	CREATETABLEPATH		= "/" + create.ENDPOINT_NAME
	UPDATETABLEPATH		= "/" + update_table.ENDPOINT_NAME
	PUTITEMPATH		= "/" + put.ENDPOINT_NAME
	GETITEMPATH		= "/" + get.ENDPOINT_NAME
	BATCHGETITEMPATH	= "/" + bgi.ENDPOINT_NAME
	BATCHWRITEITEMPATH	= "/" + bwi.ENDPOINT_NAME
	DELETEITEMPATH		= "/" + delete_item.ENDPOINT_NAME
	UPDATEITEMPATH		= "/" + update_item.ENDPOINT_NAME
	QUERYPATH               = "/" + query.ENDPOINT_NAME
	SCANPATH                = "/" + scan.ENDPOINT_NAME

	COMPATPATH              = "/"
)

var (
	// the port this invocation is actually listening on
	ListenPort *int
	availableGetHandlers []string
	availablePostHandlers []string
	availableHandlers []string
	srv *http.Server
)

type Status_Struct struct {
	Status string
	AvailableHandlers []string
	Args map[string] string
}

func init() {
	// we want this to be initialized to be unuseable
	ListenPort = nil
	// available handlers
	availableGetHandlers = []string{
		DESCRIBETABLEGETPATH,
	}
	availablePostHandlers = []string{
		DELETEITEMPATH,
		LISTTABLESPATH,
		CREATETABLEPATH,
		UPDATETABLEPATH,
		STATUSTABLEPATH,
		PUTITEMPATH,
		GETITEMPATH,
		BATCHGETITEMPATH,
		BATCHWRITEITEMPATH,
		UPDATEITEMPATH,
		QUERYPATH,
		SCANPATH,
		RAWPOSTPATH,
		COMPATPATH,
	}
	availableHandlers = append(availableHandlers,availableGetHandlers...)
	availableHandlers = append(availableHandlers,availablePostHandlers...)
	srv = nil
}

// StatusHandler displays available handlers.
func statusHandler(w http.ResponseWriter, req *http.Request) {
	if bbpd_runinfo.BBPDAbortIfClosed(w) {
		return
	}
	if (req.Method != "GET") {
		e := "method only supports GET"
		http.Error(w, e, http.StatusBadRequest)
		return
	}
	var ss Status_Struct
	ss.Args = make(map[string] string)
	ss.Status = "ready"

	ss.Args[bbpd_const.COMPACT] = "set query arg compact=1 to only receive the response body"
	ss.Args[bbpd_const.INDENT]  = "set query arg indent=1 to indent the top-level json"
	ss.AvailableHandlers = availableHandlers
	sj,sj_err := json.Marshal(ss)
	if sj_err != nil {
		e := fmt.Sprintf("bbpd_route.statusHandler:status marshal err %s",sj_err.Error())
		slog.SLog(syslog.LOG_ERR,e,true)
		http.Error(w, e, http.StatusInternalServerError)
		return
	}

	mr_err := route_response.MakeRouteResponse(
		w,
		req,
		string(sj),
		http.StatusOK,
		time.Now(),
		"Status")
	if mr_err != nil {
	 	e := fmt.Sprintf("bbpd_route.StatusHandler %s",mr_err.Error())
		slog.SLog(syslog.LOG_ERR,e,true)
	}
}

// can we use this port?
func canAssignPort(requestedPort int) (bool) {
	_,err := net.Dial("tcp",LOCALHOST+":"+strconv.Itoa(requestedPort))
	return err != nil
}

// CompatHandler allows bbpd to act as a partial pass-through proxy. Users can provide
// their own body and endpoint target header, but other headers are ignored.
// To use this, set headers with your http client. For example, with curl:
// curl -H "X-Amz-Target: DynamoDB_20120810.DescribeTable" -X POST -d '{"TableName":"mytable"}' http://localhost:12333/
// or alternately
// curl -H "X-Amz-Target: DescribeTable" -X POST -d '{"TableName":"mytable"}' http://localhost:12333/
// if you wish to just use the default API version string.
func CompatHandler(w http.ResponseWriter, req *http.Request) {
	if bbpd_runinfo.BBPDAbortIfClosed(w) {
		return
	}
	// look for the X-Amz-Target header
	target_,target_ok := req.Header[aws_const.AMZ_TARGET_HDR]
	if !target_ok  {
		e := fmt.Sprintf("bbpd_route.CompatHandler:missing %s",aws_const.AMZ_TARGET_HDR)
		slog.SLog(syslog.LOG_ERR,e,true)
		http.Error(w, e, http.StatusBadRequest)
		return
	}
	target := target_[0]
	normalized_target := target
	target_version_delim := "."
	// allow the header to have the API version string or not
	if strings.Contains(target,target_version_delim) {
		vers_target := strings.SplitN(target,target_version_delim,2)
		if vers_target[0] != aws_const.CURRENT_API_VERSION {
			e := fmt.Sprintf("bbpd_route.CompatHandler:unsupported API version '%s'",vers_target[0])
			slog.SLog(syslog.LOG_ERR,e,true)
			http.Error(w, e, http.StatusBadRequest)
			return
		}
		normalized_target = vers_target[1]
	}
	endpoint_path := "/" + normalized_target
	if endpoint_path == COMPATPATH || normalized_target == "" {
		e := fmt.Sprintf("bbpd_route.CompatHandler:must call named endpoint")
		slog.SLog(syslog.LOG_ERR,e,true)
		http.Error(w, e, http.StatusBadRequest)
		return
	}

	// call the proper handler for the header
	switch endpoint_path {
	case DESCRIBETABLEPATH	:
		describe_table_route.RawPostHandler(w,req)
		return
	case LISTTABLESPATH	:
		list_tables_route.RawPostHandler(w,req)
		return
	case CREATETABLEPATH	:
		create_table_route.RawPostHandler(w,req)
		return
	case UPDATETABLEPATH	:
		update_table_route.RawPostHandler(w,req)
		return
	case STATUSTABLEPATH	:
		describe_table_route.StatusTableHandler(w,req)
		return
	case PUTITEMPATH	:
		put_item_route.RawPostHandler(w,req)
		return
	case GETITEMPATH	:
		get_item_route.RawPostHandler(w,req)
		return
	case BATCHGETITEMPATH	:
		batch_get_item_route.BatchGetItemHandler(w,req)
		return
	case BATCHWRITEITEMPATH :
		batch_write_item_route.BatchWriteItemHandler(w,req)
		return
	case DELETEITEMPATH	:
		delete_item_route.RawPostHandler(w,req)
		return
	case UPDATEITEMPATH	:
		update_item_route.RawPostHandler(w,req)
		return
	case QUERYPATH		:
		query_route.RawPostHandler(w,req)
		return
	case SCANPATH		:
		scan_route.RawPostHandler(w,req)
		return
	default:
		e := fmt.Sprintf("bbpd_route.CompatHandler:unknown endpoint '%s'",endpoint_path)
		slog.SLog(syslog.LOG_ERR,e,true)
		http.Error(w, e, http.StatusBadRequest)
		return
	}
	e := fmt.Sprintf("bbpd_route.CompatHandler:unknown termination")
	slog.SLog(syslog.LOG_ERR,e,true)
	http.Error(w, e, http.StatusBadRequest)
	return
}

// StartBBPD is where the proxy http server is started.
// The requestedPort is a *int so it can be nil'able. passing 0 as an implied
// null value could result in a dial that takes any available port, as is
// implied by the go docs.
func StartBBPD(requestedPorts []int) error {
	// try to get a port to listen to
	for _,p := range requestedPorts {
		e := fmt.Sprintf("trying to bind to port:%d",p)
		slog.SLog(syslog.LOG_NOTICE,e,false)
		if canAssignPort(p) {
			ListenPort = &p
			break
		} else {
			e := fmt.Sprintf("port %d already in use",p)
			slog.SLog(syslog.LOG_NOTICE,e,false)
		}
	}
	if ListenPort == nil {
		return errors.New("bbpd_route.StartBBPD:no listen port")
	}
	e := fmt.Sprintf("init routing on %s:%d", bbpd_const.Host, *ListenPort)
	slog.SLog(syslog.LOG_NOTICE,e,false)
	http.HandleFunc(STATUSPATH,          statusHandler)
	http.HandleFunc(DESCRIBETABLEPATH,   describe_table_route.RawPostHandler)
	http.HandleFunc(DESCRIBETABLEGETPATH,describe_table_route.DescribeTableHandler)
	http.HandleFunc(LISTTABLESPATH,      list_tables_route.ListTablesHandler)
	http.HandleFunc(CREATETABLEPATH,     create_table_route.RawPostHandler)
	http.HandleFunc(UPDATETABLEPATH,     update_table_route.RawPostHandler)
	http.HandleFunc(STATUSTABLEPATH,     describe_table_route.StatusTableHandler)
	http.HandleFunc(PUTITEMPATH,         put_item_route.RawPostHandler)
	http.HandleFunc(GETITEMPATH,         get_item_route.RawPostHandler)
	http.HandleFunc(BATCHGETITEMPATH,    batch_get_item_route.BatchGetItemHandler)
	http.HandleFunc(BATCHWRITEITEMPATH,  batch_write_item_route.BatchWriteItemHandler)
	http.HandleFunc(DELETEITEMPATH,      delete_item_route.RawPostHandler)
	http.HandleFunc(UPDATEITEMPATH,      update_item_route.RawPostHandler)
	http.HandleFunc(QUERYPATH,           query_route.RawPostHandler)
	http.HandleFunc(SCANPATH,            scan_route.RawPostHandler)
	http.HandleFunc(RAWPOSTPATH,         raw_post_route.RawPostHandler)
	http.HandleFunc(COMPATPATH,          CompatHandler)

	// undelete these to enable table deletions, a little dangerous!
	// http.HandleFunc(DELETETABLEPATH,     delete_table_route.RawPostHandler)
	// http.HandleFunc(DELETETABLEGETPATH,  delete_table_route.DeleteTableHandler)
	srv = &http.Server{
		Addr: ":"+strconv.Itoa(*ListenPort),
		ReadTimeout: 30*time.Second,
		WriteTimeout: 30*time.Second,
	}
	bbpd_runinfo.SetBBPDAccept()
	return srv.ListenAndServe()
}
