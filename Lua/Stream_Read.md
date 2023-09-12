# Stream:Read

This method reads a block of memory from a stream. This can be more efficient than reading one value at a time, and supports additional data types where there is not an explicit read method for.

## Syntax

- **Read**(data: [Buffer](Buffer.md), offset: number, size: number): number
- **Read**(data: pointer, size: number): number

| Parameter | Description |
| --- | --- |
| offset | offset in bytes from memory buffer beginning |
| data | buffer or pointer to write to |
| size | number of bytes to read |

## Returns

Returns the number of bytes that were read from the stream.

## Example

```Lua
local path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
local stream = OpenFile(path)
if stream == nil then
    Print("Failed to write file.")
    return 0
end

-- Initialize data
local data = {100, 101, 102, 103, 104, 105, 106, 107, 108, 109}

-- Write data to the stream
stream:Write(&data[0], sizeof(data[0]) * #data)

-- Change the stream position
stream:Seek(0)

-- Read back the data
stream:Read(&data[0], sizeof(data[0]) * #data)

for i, value in ipairs(data) do
    Print(value)
end

return 0
```