curl -H "X-Amz-Target: DynamoDB_20120810.BatchWriteItem" -X POST -d '{"RequestItems":{"test-godynamo-livetest":[{"PutRequest":{"Item":{"SomeValue":{"N":"51"},"TheHashKey":{"S":"AHashKey51"},"TheRangeKey":{"N":"51"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"52"},"TheHashKey":{"S":"AHashKey52"},"TheRangeKey":{"N":"52"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"53"},"TheHashKey":{"S":"AHashKey53"},"TheRangeKey":{"N":"53"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"54"},"TheHashKey":{"S":"AHashKey54"},"TheRangeKey":{"N":"54"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"55"},"TheHashKey":{"S":"AHashKey55"},"TheRangeKey":{"N":"55"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"56"},"TheHashKey":{"S":"AHashKey56"},"TheRangeKey":{"N":"56"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"57"},"TheHashKey":{"S":"AHashKey57"},"TheRangeKey":{"N":"57"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"58"},"TheHashKey":{"S":"AHashKey58"},"TheRangeKey":{"N":"58"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"59"},"TheHashKey":{"S":"AHashKey59"},"TheRangeKey":{"N":"59"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"60"},"TheHashKey":{"S":"AHashKey60"},"TheRangeKey":{"N":"60"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"61"},"TheHashKey":{"S":"AHashKey61"},"TheRangeKey":{"N":"61"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"62"},"TheHashKey":{"S":"AHashKey62"},"TheRangeKey":{"N":"62"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"63"},"TheHashKey":{"S":"AHashKey63"},"TheRangeKey":{"N":"63"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"64"},"TheHashKey":{"S":"AHashKey64"},"TheRangeKey":{"N":"64"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"65"},"TheHashKey":{"S":"AHashKey65"},"TheRangeKey":{"N":"65"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"66"},"TheHashKey":{"S":"AHashKey66"},"TheRangeKey":{"N":"66"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"67"},"TheHashKey":{"S":"AHashKey67"},"TheRangeKey":{"N":"67"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"68"},"TheHashKey":{"S":"AHashKey68"},"TheRangeKey":{"N":"68"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"69"},"TheHashKey":{"S":"AHashKey69"},"TheRangeKey":{"N":"69"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"70"},"TheHashKey":{"S":"AHashKey70"},"TheRangeKey":{"N":"70"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"71"},"TheHashKey":{"S":"AHashKey71"},"TheRangeKey":{"N":"71"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"72"},"TheHashKey":{"S":"AHashKey72"},"TheRangeKey":{"N":"72"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"73"},"TheHashKey":{"S":"AHashKey73"},"TheRangeKey":{"N":"73"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"74"},"TheHashKey":{"S":"AHashKey74"},"TheRangeKey":{"N":"74"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"75"},"TheHashKey":{"S":"AHashKey75"},"TheRangeKey":{"N":"75"}}}}]},"ReturnConsumedCapacity":"NONE","ReturnItemCollectionMetrics":"NONE"}' http://localhost:12333/