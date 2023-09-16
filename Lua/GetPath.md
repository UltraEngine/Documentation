# GetPath

This function returns a system path.

## Syntax

- GetPath(path)

| Parameters | Description |
|--|--|
| path | indicates which system path to retrieve, can be `PATH_DESKTOP`, `PATH_DOCUMENTS`, or P`ATH_PROGRAMDATA` |

## Returns

Returns a string containing a file path.

## Example

```lua
Print(GetPath(PATH_DESKTOP))
Print(GetPath(PATH_DOCUMENTS))
Print(GetPath(PATH_PROGRAMDATA))
```
