# DeleteDir

This function deletes a folder in the file system.

## Syntax

- bool **DeleteDir**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
| --- | --- |
| path | folder location to delete |

## Returns

Returns true if the folder was successfully deleted.

## Example

```lua
local path = GetPath(PATH_DOCUMENTS) .. "/Temp Folder"

CreateDir(path)
if FileType(path) ~= 2 then
    Print("Failed to write folder.")
    return 0
end

Print("Folder created.")

OpenDir(ExtractDir(path))
Sleep(3000)

if DeleteDir(path) then
    Print("Folder deleted.")
else
    Print("Failed to delete folder.")
end
```
