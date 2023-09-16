# Stream:Write

This method writes a block of memory to the stream. This can be more efficient than writing one value at a time, and supports additional data types there is not an explicit write method for.

## Syntax

- number **Write**([Buffer](Buffer.md) data, number offset, number size)
- number **Write**(userdata data, number offset, number size)

| Parameter | Description |
| --- | --- |
| data | buffer or pointer to read from |
| offset | offset in bytes from memory buffer beginning |
| size | number of bytes to write |

## Returns

Returns the number of bytes that were written to the stream.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
local stream = OpenFile(path)
if stream == nil then
	Print("Failed to write file.")
	return
end

-- Initialize data
local data = {}
for n = 1, 10 do
	data[n] = 100 + n
end

-- Write data to the stream
stream:Write(data, 0, sizeof(data[0]) * #data)

-- Change the stream position
stream:Seek(0)

-- Read back the data
stream:Read(data, 0, sizeof(data[0]) * #data)

for n = 1, 10 do
	Print(data[n])
end
```
