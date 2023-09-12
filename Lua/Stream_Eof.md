# Stream:Eof

This method returns true when the end of the stream is reached.

Syntax:
```lua
function Stream:Eof() -> bool
```

Returns:
- Returns true if the file position is equal to the stream size minus one, otherwise false is returned.

Example:
```lua
local path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Open a stream with read and write permissions
DeleteFile(path)
local stream = OpenFile(path)
if stream == nil then
    Print("Failed to write file.")
    return 0
end

-- Write some data
for n = 0, 9 do
    stream:WriteInt(n)
end

-- Change the stream position
stream:Seek(0)

-- Read back the data
while not stream:Eof() do
    Print(stream:ReadInt())
end
```