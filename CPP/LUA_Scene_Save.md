# Scene::Save #
This method saves a scene to a stream or file.

The Lua state of each entity in the scene will be serialized in the saved file. Because of differences between the Lua language and the JSON schematic, the following rules should be noted:

A table that contains only numbers for keys, whose keys include each integer from 1 to the size of the table, will be saved as a JSON list. This occurs when table.insert() is used to insert values into a table as if it was an array.

Lua:
```lua
self.table = {}
table.insert(self.table, "a")
table.insert(self.table, "b")
table.insert(self.table, "c")
```
JSON:
```js
{
  "table": [
    "a",
    "b",
    "c"
  ]
}
```
If a table is saved that does not convert to a JSON list, any number keys will be converted to strings.

Lua:
```lua
self.table = {}
self.table[1] = "a"
self.table["key"] = "b"
```
JSON:
```js
{
  "table": {
    "1": "a",
    "key", "b"
  }
}
```
Table keys that are booleans will be stored as the strings "true" or "false":

Lua:
```lua
self.table = {}
self.table[true] = "value"
```
JSON:
```js
{
  "table": {
    "true": "value"
  }
}
```
A string value that can be converted to a number will be loaded as a number.
Entity values will be saved as a string indicating the entity's GUID.
A string value in the GUID format ("xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx") will be converted to the matching entity if it exists in the scene file. If the entity cannot be found the key pair will not be loaded.
Tables keys that are the strings "true" or "false" will be converted to a boolean value when loaded.
Key pairs that use a table for the key will not be saved:
```lua
self.table1 = {}
self.table2 = {}
self.table2[table1] = 1
```
## Syntax ##

## Example ##