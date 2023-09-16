# Stream:GetPosition

This method returns the current offset in the stream for read and write operations.

## Syntax

- number **GetPosition**()

## Returns

Returns the stream position in bytes.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with write permissions
stream = WriteFile(path)
if stream == nil then
    Print("Failed to write file.")
    return
end

-- Write a byte
stream:WriteByte(1)
Print("Position: " .. stream:GetPosition())
Print("Size: " .. stream:GetSize())

-- Write a short
stream:WriteShort(2)
Print("Position: " .. stream:GetPosition())
Print("Size: " .. stream:GetSize())

-- Write an integer
stream:WriteInt(3)
Print("Position: " .. stream:GetPosition())
Print("Size: " .. stream:GetSize())

-- Write a float
stream:WriteFloat(4)
Print("Position: " .. stream:GetPosition())
Print("Size: " .. stream:GetSize())

-- Write a double
stream:WriteDouble(5)
Print("Position: " .. stream:GetPosition())
Print("Size: " .. stream:GetSize())
```
