# Stream:WriteLine

This method writes a line of text to the stream at the current position.

## Syntax

- **WriteLine**([string](https://www.lua.org/manual/5.4/manual.html#6.4) s)

| Parameter | Description |
|---|---|
| s | value to write |

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
