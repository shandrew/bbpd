curl -H "X-Amz-Target: DynamoDB_20120810.BatchWriteItem" -X POST -d '{"RequestItems":{"test-godynamo-livetest":[{"PutRequest":{"Item":{"SomeValue":{"N":"201"},"TheHashKey":{"S":"AHashKey201"},"TheRangeKey":{"N":"201"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"202"},"TheHashKey":{"S":"AHashKey202"},"TheRangeKey":{"N":"202"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"203"},"TheHashKey":{"S":"AHashKey203"},"TheRangeKey":{"N":"203"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"204"},"TheHashKey":{"S":"AHashKey204"},"TheRangeKey":{"N":"204"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"205"},"TheHashKey":{"S":"AHashKey205"},"TheRangeKey":{"N":"205"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"206"},"TheHashKey":{"S":"AHashKey206"},"TheRangeKey":{"N":"206"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"207"},"TheHashKey":{"S":"AHashKey207"},"TheRangeKey":{"N":"207"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"208"},"TheHashKey":{"S":"AHashKey208"},"TheRangeKey":{"N":"208"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"209"},"TheHashKey":{"S":"AHashKey209"},"TheRangeKey":{"N":"209"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"210"},"TheHashKey":{"S":"AHashKey210"},"TheRangeKey":{"N":"210"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"211"},"TheHashKey":{"S":"AHashKey211"},"TheRangeKey":{"N":"211"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"212"},"TheHashKey":{"S":"AHashKey212"},"TheRangeKey":{"N":"212"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"213"},"TheHashKey":{"S":"AHashKey213"},"TheRangeKey":{"N":"213"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"214"},"TheHashKey":{"S":"AHashKey214"},"TheRangeKey":{"N":"214"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"215"},"TheHashKey":{"S":"AHashKey215"},"TheRangeKey":{"N":"215"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"216"},"TheHashKey":{"S":"AHashKey216"},"TheRangeKey":{"N":"216"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"217"},"TheHashKey":{"S":"AHashKey217"},"TheRangeKey":{"N":"217"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"218"},"TheHashKey":{"S":"AHashKey218"},"TheRangeKey":{"N":"218"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"219"},"TheHashKey":{"S":"AHashKey219"},"TheRangeKey":{"N":"219"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"220"},"TheHashKey":{"S":"AHashKey220"},"TheRangeKey":{"N":"220"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"221"},"TheHashKey":{"S":"AHashKey221"},"TheRangeKey":{"N":"221"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"222"},"TheHashKey":{"S":"AHashKey222"},"TheRangeKey":{"N":"222"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"223"},"TheHashKey":{"S":"AHashKey223"},"TheRangeKey":{"N":"223"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"224"},"TheHashKey":{"S":"AHashKey224"},"TheRangeKey":{"N":"224"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"225"},"TheHashKey":{"S":"AHashKey225"},"TheRangeKey":{"N":"225"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"226"},"TheHashKey":{"S":"AHashKey226"},"TheRangeKey":{"N":"226"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"227"},"TheHashKey":{"S":"AHashKey227"},"TheRangeKey":{"N":"227"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"228"},"TheHashKey":{"S":"AHashKey228"},"TheRangeKey":{"N":"228"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"229"},"TheHashKey":{"S":"AHashKey229"},"TheRangeKey":{"N":"229"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"230"},"TheHashKey":{"S":"AHashKey230"},"TheRangeKey":{"N":"230"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"231"},"TheHashKey":{"S":"AHashKey231"},"TheRangeKey":{"N":"231"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"232"},"TheHashKey":{"S":"AHashKey232"},"TheRangeKey":{"N":"232"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"233"},"TheHashKey":{"S":"AHashKey233"},"TheRangeKey":{"N":"233"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"234"},"TheHashKey":{"S":"AHashKey234"},"TheRangeKey":{"N":"234"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"235"},"TheHashKey":{"S":"AHashKey235"},"TheRangeKey":{"N":"235"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"236"},"TheHashKey":{"S":"AHashKey236"},"TheRangeKey":{"N":"236"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"237"},"TheHashKey":{"S":"AHashKey237"},"TheRangeKey":{"N":"237"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"238"},"TheHashKey":{"S":"AHashKey238"},"TheRangeKey":{"N":"238"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"239"},"TheHashKey":{"S":"AHashKey239"},"TheRangeKey":{"N":"239"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"240"},"TheHashKey":{"S":"AHashKey240"},"TheRangeKey":{"N":"240"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"241"},"TheHashKey":{"S":"AHashKey241"},"TheRangeKey":{"N":"241"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"242"},"TheHashKey":{"S":"AHashKey242"},"TheRangeKey":{"N":"242"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"243"},"TheHashKey":{"S":"AHashKey243"},"TheRangeKey":{"N":"243"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"244"},"TheHashKey":{"S":"AHashKey244"},"TheRangeKey":{"N":"244"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"245"},"TheHashKey":{"S":"AHashKey245"},"TheRangeKey":{"N":"245"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"246"},"TheHashKey":{"S":"AHashKey246"},"TheRangeKey":{"N":"246"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"247"},"TheHashKey":{"S":"AHashKey247"},"TheRangeKey":{"N":"247"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"248"},"TheHashKey":{"S":"AHashKey248"},"TheRangeKey":{"N":"248"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"249"},"TheHashKey":{"S":"AHashKey249"},"TheRangeKey":{"N":"249"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"250"},"TheHashKey":{"S":"AHashKey250"},"TheRangeKey":{"N":"250"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"251"},"TheHashKey":{"S":"AHashKey251"},"TheRangeKey":{"N":"251"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"252"},"TheHashKey":{"S":"AHashKey252"},"TheRangeKey":{"N":"252"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"253"},"TheHashKey":{"S":"AHashKey253"},"TheRangeKey":{"N":"253"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"254"},"TheHashKey":{"S":"AHashKey254"},"TheRangeKey":{"N":"254"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"255"},"TheHashKey":{"S":"AHashKey255"},"TheRangeKey":{"N":"255"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"256"},"TheHashKey":{"S":"AHashKey256"},"TheRangeKey":{"N":"256"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"257"},"TheHashKey":{"S":"AHashKey257"},"TheRangeKey":{"N":"257"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"258"},"TheHashKey":{"S":"AHashKey258"},"TheRangeKey":{"N":"258"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"259"},"TheHashKey":{"S":"AHashKey259"},"TheRangeKey":{"N":"259"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"260"},"TheHashKey":{"S":"AHashKey260"},"TheRangeKey":{"N":"260"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"261"},"TheHashKey":{"S":"AHashKey261"},"TheRangeKey":{"N":"261"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"262"},"TheHashKey":{"S":"AHashKey262"},"TheRangeKey":{"N":"262"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"263"},"TheHashKey":{"S":"AHashKey263"},"TheRangeKey":{"N":"263"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"264"},"TheHashKey":{"S":"AHashKey264"},"TheRangeKey":{"N":"264"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"265"},"TheHashKey":{"S":"AHashKey265"},"TheRangeKey":{"N":"265"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"266"},"TheHashKey":{"S":"AHashKey266"},"TheRangeKey":{"N":"266"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"267"},"TheHashKey":{"S":"AHashKey267"},"TheRangeKey":{"N":"267"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"268"},"TheHashKey":{"S":"AHashKey268"},"TheRangeKey":{"N":"268"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"269"},"TheHashKey":{"S":"AHashKey269"},"TheRangeKey":{"N":"269"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"270"},"TheHashKey":{"S":"AHashKey270"},"TheRangeKey":{"N":"270"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"271"},"TheHashKey":{"S":"AHashKey271"},"TheRangeKey":{"N":"271"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"272"},"TheHashKey":{"S":"AHashKey272"},"TheRangeKey":{"N":"272"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"273"},"TheHashKey":{"S":"AHashKey273"},"TheRangeKey":{"N":"273"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"274"},"TheHashKey":{"S":"AHashKey274"},"TheRangeKey":{"N":"274"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"275"},"TheHashKey":{"S":"AHashKey275"},"TheRangeKey":{"N":"275"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"276"},"TheHashKey":{"S":"AHashKey276"},"TheRangeKey":{"N":"276"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"277"},"TheHashKey":{"S":"AHashKey277"},"TheRangeKey":{"N":"277"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"278"},"TheHashKey":{"S":"AHashKey278"},"TheRangeKey":{"N":"278"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"279"},"TheHashKey":{"S":"AHashKey279"},"TheRangeKey":{"N":"279"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"280"},"TheHashKey":{"S":"AHashKey280"},"TheRangeKey":{"N":"280"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"281"},"TheHashKey":{"S":"AHashKey281"},"TheRangeKey":{"N":"281"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"282"},"TheHashKey":{"S":"AHashKey282"},"TheRangeKey":{"N":"282"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"283"},"TheHashKey":{"S":"AHashKey283"},"TheRangeKey":{"N":"283"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"284"},"TheHashKey":{"S":"AHashKey284"},"TheRangeKey":{"N":"284"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"285"},"TheHashKey":{"S":"AHashKey285"},"TheRangeKey":{"N":"285"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"286"},"TheHashKey":{"S":"AHashKey286"},"TheRangeKey":{"N":"286"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"287"},"TheHashKey":{"S":"AHashKey287"},"TheRangeKey":{"N":"287"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"288"},"TheHashKey":{"S":"AHashKey288"},"TheRangeKey":{"N":"288"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"289"},"TheHashKey":{"S":"AHashKey289"},"TheRangeKey":{"N":"289"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"290"},"TheHashKey":{"S":"AHashKey290"},"TheRangeKey":{"N":"290"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"291"},"TheHashKey":{"S":"AHashKey291"},"TheRangeKey":{"N":"291"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"292"},"TheHashKey":{"S":"AHashKey292"},"TheRangeKey":{"N":"292"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"293"},"TheHashKey":{"S":"AHashKey293"},"TheRangeKey":{"N":"293"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"294"},"TheHashKey":{"S":"AHashKey294"},"TheRangeKey":{"N":"294"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"295"},"TheHashKey":{"S":"AHashKey295"},"TheRangeKey":{"N":"295"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"296"},"TheHashKey":{"S":"AHashKey296"},"TheRangeKey":{"N":"296"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"297"},"TheHashKey":{"S":"AHashKey297"},"TheRangeKey":{"N":"297"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"298"},"TheHashKey":{"S":"AHashKey298"},"TheRangeKey":{"N":"298"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"299"},"TheHashKey":{"S":"AHashKey299"},"TheRangeKey":{"N":"299"}}}},{"PutRequest":{"Item":{"SomeValue":{"N":"300"},"TheHashKey":{"S":"AHashKey300"},"TheRangeKey":{"N":"300"}}}}]},"ReturnConsumedCapacity":"NONE","ReturnItemCollectionMetrics":"NONE"}' http://localhost:12333/