# Buffer:GetSize

This method retrieves the size of the allocated memory block.

## Syntax

```lua
function Buffer:GetSize()
```

## Returns

Returns the size of the allocated memory block, in bytes.

## Example

```lua
--Create a buffer
local buffer = CreateBuffer(10)

--Resize the buffer
buffer:Resize(20)

--Get the buffer size
Print(buffer:GetSize())
```