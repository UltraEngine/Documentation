# LoadTable

This function loads a Lua table from a JSON file or open stream.

## Syntax

- [table](https://www.lua.org/manual/5.4/manual.html#6.6) LoadTable([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)
- [table](https://www.lua.org/manual/5.4/manual.html#6.6) LoadTable([Stream](Stream.md) stream)

| Parameter | Description |
|---|---|
| path | A string representing the file path to load. |
| stream | A userdata representing the stream to read from. |

## Returns

If successful the loaded table is returned, otherwise `nil` is returned.
