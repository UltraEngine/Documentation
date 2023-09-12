# Stream:ReadWLine #

This method reads a line of wide text from the stream.

## Syntax ##

`stream:ReadWLine()`

## Returns ##

Returns a line of wide text from the stream.

## Example

```lua
local path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
local stream = WriteFile(path)
if (stream == nil) then
    Print("Failed to write file.")
    return 0
end

stream:WriteWLine("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadWLine())
```