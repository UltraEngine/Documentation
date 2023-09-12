# FileSize

This function gets the size of a file.

## Syntax

```lua
function FileSize(path: string, packages: boolean): number
```

## Parameters

| Parameter | Description |
|---|---|
| path | The file path to check. |
| packages | If set to `true`, all loaded packages will be checked after the file system. |

## Returns

Returns the size of the file at the specified path if it exists, otherwise returns zero.