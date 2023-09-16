# FileSize

This function gets the size of a file.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4.1) **FileSize**([string](https://www.lua.org/manual/5.4/manual.html#6.4.1) path, boolean packages = true)

| Parameter | Description |
|---|---|
| path | The file path to check. |
| packages | If set to `true`, all loaded packages will be checked after the file system. |

## Returns

Returns the size of the file at the specified path if it exists, otherwise returns zero.
