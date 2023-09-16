# Stream:WriteDouble

This function writes a double float value to the stream at the current position.

## Syntax

- **WriteDouble**(number f)

| Parameter | Description |
|---|---|
| f | the value to write |

## Example

```lua
local path = engine.GetPath(engine.PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
engine.DeleteFile(path)
local stream = engine.OpenFile(path)
if stream == nil then
    print("Failed to write file.")
    return
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
print(stream:ReadByte())
print(stream:ReadDouble())
print(stream:ReadFloat())
print(stream:ReadInt())
print(stream:ReadShort())

-- Close the stream
stream:Close()
```
