# CreateFile

This function creates a new file on the user's hard drive. The new file will initially be empty. If a file exists at this location it will be overwritten.

## Syntax
```lua
function CreateFile(path)
```

- **path**: full or relative path to the new file

## Example
```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Create a new file
if not CreateFile(path) then
    print("Failed to write file.")
    return 0
end

OpenDir(path)
```