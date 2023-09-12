# Stream:WriteLine #
This method writes a line of text to the stream at the current position.

## Syntax ##
- `Stream:WriteLine(s)`

### Parameters ###
- `s` (string): value to write

## Example

```lua
local path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
local stream = WriteFile(path)
if stream == nil then
    Print("Failed to write file.")
    return 0
end

stream:WriteLine("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadLine())
```
