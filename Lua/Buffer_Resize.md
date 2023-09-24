# Buffer:Resize

This function resizes the allocated memory block. The contents of the buffer will be retained in the new memory block.

## Syntax

- boolean **Resize**(number size)

| Parameter | Description |
| ----| ----|
| size | new size of the memory block |
| padding | if set to true the new block may be automatically padded internally for faster resizing |

## Returns

Returns true if the memory block is successfully resized, otherwise false is returned.

## Example

```lua
-- Create a buffer
local buffer = CreateBuffer(10)

-- Resize the buffer
buffer:Resize(20)

-- Get the buffer size
Print(buffer:GetSize())
```
