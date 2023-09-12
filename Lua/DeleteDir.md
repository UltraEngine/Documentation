# DeleteDir

This function deletes a folder in the file system.

## Syntax

```lua
function DeleteDir(path: WString, recursive: boolean = false): boolean
```

* `path` - folder location to delete
* `recursive` - if set to true, all files and subfolders will be deleted

## Returns
Returns true if the folder was successfully deleted.

## Remarks
If any files or subfolders exist within the specified folder, it will not be deleted unless the `recursive` option is set to true. **Use this option with caution.**

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