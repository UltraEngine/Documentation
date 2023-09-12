# Stream:Write

This function writes a block of memory to the stream. This can be more efficient than writing one value at a time, and supports additional data types there is not an explicit write method for.

## Syntax

```lua
function Stream:Write(data, offset, size)
```

- `data` (userdata or pointer): buffer or pointer to read from
- `offset` (number): offset in bytes from memory buffer beginning
- `size` (number): number of bytes to write

## Returns

The function returns the number of bytes that were written to the stream.

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