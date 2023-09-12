# DeleteFile

This function deletes a file in the file system.

## Syntax

- **DeleteFile**(path: [string](https://www.lua.org/manual/5.4/manual.html#6.4))

## Return value

- Returns true if the file was successfully deleted.

## Remarks

It is not possible to restore deleted files. Use this feature with caution.

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