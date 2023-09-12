# LoadBuffer
This function loads a buffer from a file.

## Syntax
```lua
-- Load a buffer from a file
--@param path The file name to load
--@param flags Optional load settings
--@return Returns the loaded buffer if successful, otherwise nil is returned.
function LoadBuffer(path: string, flags: number): buffer
```

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
Print(buffer:PeekInt(0))
Print(buffer:PeekInt(4))
Print(buffer:PeekInt(8))
Print(buffer:PeekInt(12))
```