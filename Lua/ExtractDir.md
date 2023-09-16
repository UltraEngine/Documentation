# ExtractDir

This function returns the folder part of a file path.

## Syntax

- [string](https://www.lua.org/manual/5.4/manual.html#6.4) **ExtractDir**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
| --- | --- |
| path | full or relative file path |

## Returns

Returns the folder part of the specified path.

## Example

```lua
path = "C:/Windows/explorer.exe"

print("Full path: " .. path)
print("File name: " .. StripDir(path))
print("File directory: " .. ExtractDir(path))
print("File extension: " .. ExtractExt(path))
print("File name without extension: " .. StripAll(path))
print("File path without extension: " .. StripExt(path))
```
