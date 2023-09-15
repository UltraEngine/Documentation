# Package:FileTime

This function returns the last modification time of a file in the package.

## Syntax

- number FileTime([string](https://www.lua.org/manual/5.4/manual.html#6.4))

### Parameters

| Parameter | Description |
|---|---|
| path | The relative file path. |

### Returns

If the file exists, its last modification time will be returned. Otherwise, zero will be returned.
