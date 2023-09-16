# Stream:ReadLine #

This method reads a line of text from the stream.

## Syntax ##

- **Stream:ReadLine**() -> [string](https://www.lua.org/manual/5.4/manual.html#6.4.1)

## Returns ##

Returns a line of text from the stream.

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
stream = WriteFile(path)
if stream == nil then
    print("Failed to write file.")
    return
end

stream:WriteLine("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadLine())
```
