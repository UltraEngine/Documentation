# Stream:WriteString #
This method writes a string to the stream at the current position.

## Syntax ##
```lua
Stream:WriteString(s, terminate = true)
```

### Parameters ###
| Name | Description |
|---|---|
| s | the string to write |
| terminate | if true, an extra byte with a value of zero will be written at the end of the string |

## Example

```lua
path = GetPath(PATH_DOCUMENTS) .. "/temp.txt"

-- Write a new file
stream = WriteFile(path)
if stream == nil then
    Print("Failed to write file.")
    return
end

stream:WriteString("Hello, world!")
stream:Close()

stream = ReadFile(path)
Print(stream:ReadString())
```
