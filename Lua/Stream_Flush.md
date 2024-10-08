# Stream:Flush

This method writes all queued data to the stream. You generally do not need to call this, as it will be done automatically.

## Syntax

- **Flush**()

## Example

```lua
local path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"

-- Write a new file
local stream = WriteFile(path)
if stream == nil then
    Print("Failed to write file.")
    return
end

for i = 1, 1024 do
    stream:WriteInt(i)
end

Print("File size before Stream:Flush(): " .. tostring(FileSize(path)))

stream:Flush()

Print("File size after Stream:Flush(): " .. tostring(FileSize(path)))
```
