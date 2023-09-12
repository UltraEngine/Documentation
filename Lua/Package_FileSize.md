# Package.FileSize

This method returns the size of a file in the archive.

## Syntax

```lua
function Package.FileSize(path: string): number
```

## Parameters

| Parameter | Description |
|---|---|
| path | Relative file path |

## Returns

If the file exists, its size will be returned as a number. If the file does not exist, zero will be returned.