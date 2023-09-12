# Stream:ReadWString #
This method reads a wide null-terminated string from the stream.

## Syntax ##
- [WString](WString.md) **ReadWString**()

## Returns ##
Returns a wide string value read from the file.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) + "/temp.txt"

-- Write a new file
stream = WriteFile(path)
if (stream == nil) then
    Print("Failed to write file.")
    return 0
end

stream:WriteWString("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadWString())

return 0
```