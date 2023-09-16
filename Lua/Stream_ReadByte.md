# Stream:ReadByte

This method reads a single byte from a stream.

## Syntax

- number **ReadByte**()

## Returns

Returns a byte read from the stream.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
stream = OpenFile(path)
if stream == nil then
    Print("Failed to write file.")
    return 0
end

-- Write some data
stream:WriteByte(1)
stream:WriteDouble(2.0)
stream:WriteFloat(3.0)
stream:WriteInt(4)
stream:WriteShort(5)

-- Change the stream position
stream:Seek(0)

-- Read back the data
Print(stream:ReadByte())
Print(stream:ReadDouble())
Print(stream:ReadFloat())
Print(stream:ReadInt())
Print(stream:ReadShort())

-- Close the stream
stream:Close()
```
