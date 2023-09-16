# GetPath

This function returns a system path.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) GetPath(path)

| Parameters | Description |
|--|--|
| path | indicates which system path to retrieve, can be PATH_DESKTOP, PATH_DOCUMENTS, or PATH_PROGRAMDATA |

## Returns

Returns a string containing a file path.

## Example

```lua
Print(GetPath(PATH_DESKTOP))
Print(GetPath(PATH_DOCUMENTS))
Print(GetPath(PATH_PROGRAMDATA))
```
