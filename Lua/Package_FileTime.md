# Package:FileTime

This function returns the last modification time of a file in the package.

## Syntax

```lua
function FileTime(path: string): number
```

### Parameters

| Parameter | Description |
|---|---|
| path | The relative file path. |

### Returns

If the file exists, its last modification time will be returned. Otherwise, zero will be returned.