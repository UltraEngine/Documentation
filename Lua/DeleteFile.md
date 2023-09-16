# DeleteFile

This function deletes a file.

## Syntax

- boolean **DeleteFile**([string](https://www.lua.org/manual/5.4/manual.html#6.4) path)

| Parameter | Description |
| --- | --- |
| path | file path to delete |

## Returns

Returns true if the file was successfully deleted.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

CreateFile(path)
if FileType(path) ~= 1 then
    print("Failed to write file.")
    return
end

print("File created.")

OpenDir(path)
Sleep(3000)

if DeleteFile(path) then
    print("File deleted.")
else
    print("Failed to delete file.")
end
```
