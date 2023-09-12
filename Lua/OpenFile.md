# OpenFile

This function opens a file and returns a stream for read and write operations. If no file exists at the specified path, a new empty file will be created.

## Syntax

```lua
function OpenFile(path: string): Stream
```

### Parameters

| Parameter | Description |
|---|---|
| **path** | file path to open |

## Returns

Returns an open stream for read and write operations if the file was successfully created, otherwise `nil` is returned.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
stream = OpenFile(path)
if stream == nil then
    print("Failed to write file.")
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
print(stream:ReadByte())
print(stream:ReadDouble())
print(stream:ReadFloat())
print(stream:ReadInt())
print(stream:ReadShort())

-- Close the stream
stream:Close()
```