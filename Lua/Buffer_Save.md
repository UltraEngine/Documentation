# Buffer:Save

This method saves the buffer's contents to a file.

## Syntax
```lua
function Buffer:Save(path: string): boolean
```

| Parameter | Description |
|---|---|
| path | file name to save |

## Returns

Returns `true` if the file is saved successfully, otherwise `false` is returned.

## Example

```lua
--Create a buffer
local buffer = CreateBuffer(16)
buffer:PokeInt(0, 1)
buffer:PokeInt(4, 2)
buffer:PokeInt(8, 3)
buffer:PokeInt(12, 4)

--Save the buffer
local path = GetPath(PATH_DOCUMENTS) .. "/temp.bin"
if not buffer:Save(path) then
    error("Failed to save buffer.")
end

--Load the buffer
buffer = LoadBuffer(path)
if buffer == nil then
    error("Failed to load buffer.")
end
DeleteFile(path)

assert(buffer:GetSize() == 16)
print(buffer:PeekInt(0))
print(buffer:PeekInt(4))
print(buffer:PeekInt(8))
print(buffer:PeekInt(12))
```