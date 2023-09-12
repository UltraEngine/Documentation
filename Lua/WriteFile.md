# WriteFile

This function creates a new file and returns a stream for write operations.

## Syntax

```lua
function WriteFile(path: string): Stream
```

## Parameters

| Parameter | Description |
|--|--|
| **path** | file path to save |

## Returns

Returns an open stream for write operations if the file was successfully created, otherwise `nil` is returned.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
stream = WriteFile(path)
if stream == nil then
    Print("Failed to write file.")
    return 0
end

stream:WriteString("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadString())

return 0
```