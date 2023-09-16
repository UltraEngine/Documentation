# StripDir

This function removes the folder part from a file path and returns the result.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **StripDir**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns

Returns the file path with the folder removed.

## Example

```lua
path = "C:/Windows/explorer.exe"

Print("Full path: " .. path)
Print("File name: " .. StripDir(path))
Print("File directory: " .. ExtractDir(path))
Print("File extension: " .. ExtractExt(path))
Print("File name without extension: " .. StripAll(path))
Print("File path without extension: " .. StripExt(path))
```
