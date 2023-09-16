# RenameFile

This function changes the name of an existing file.

## Syntax 

- boolean **RenameFile**([string]([src](https://www.lua.org/manual/5.4/manual.html#6.4) src, [string]([src](https://www.lua.org/manual/5.4/manual.html#6.4) dest)

| Parameter | Description |
|---|---|
| src | existing file path |
| dest | new file name |

## Returns

Returns true if the file was successfully renamed, otherwise false is returned.

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

--Create a new file
if not CreateFile(path) then
    Print("Failed to write file.")
    return 0
end

--Rename the file
local dst = ExtractDir(path) .. "/temp2.txt"
DeleteFile(dst)
if not RenameFile(path, dst) then
    Print("Failed to rename file.")
end

OpenDir(dst)
```
