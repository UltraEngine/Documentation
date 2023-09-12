# StripAll #
This function removes the folder and file extension parts from a file path and returns the result.

## Syntax ##
`WString StripAll(const WString& path)`

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns ##
Returns the file path with the folder and extension removed.

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