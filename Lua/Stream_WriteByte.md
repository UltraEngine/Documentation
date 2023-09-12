## Stream:WriteByte
This function writes a single byte value to the stream at the current position.

### Syntax
```lua
function Stream:WriteByte(b: number)
```

#### Parameters
* `b` (number): The value to write.

### Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
local stream = OpenFile(path)
if stream == nil then
    Print("Failed to write file.")
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
Print(stream:ReadByte())
Print(stream:ReadDouble())
Print(stream:ReadFloat())
Print(stream:ReadInt())
Print(stream:ReadShort())

-- Close the stream
stream:Close()
```

Note: The code assumes that all the required libraries are already imported in Lua and the `OpenFile()` function returns a valid stream object.