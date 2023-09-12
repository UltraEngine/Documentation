# ShowFile

This function makes the specified file or folder visible in the file system.

## Syntax
```lua
function ShowFile(path: string): boolean
```

## Returns
Returns `true` if the operation was successful or if the file was already visible, otherwise `false` is returned.

## Example
```lua
-- Make the file "C:\Users\User\Documents\example.txt" visible in the file system
local success = ShowFile("C:\\Users\\User\\Documents\\example.txt")
if success then
    print("File is now visible")
else
    print("Failed to make file visible")
end
```