# ExtractExt #

This function returns the extension part of a file path.

## Syntax ##

- [string](string) **ExtractExt**(path: [string](string))

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns ##

Returns the extension part of the specified path.

## Example
```lua
local path = "C:/Windows/explorer.exe"

Print("Full path: " .. path)
Print("File name: " .. StripDir(path))
Print("File directory: " .. ExtractDir(path))
Print("File extension: " .. ExtractExt(path))	
Print("File name without extension: " .. StripAll(path))
Print("File path without extension: " .. StripExt(path))
```