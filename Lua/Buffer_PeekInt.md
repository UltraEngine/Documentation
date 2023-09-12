## Buffer:PeekInt

This method returns an integer value from the memory buffer.

### Syntax

```lua
function Buffer:PeekInt(pos: number): number
```

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

### Returns

Returns an integer value.

### Remarks

A runtime error will occur if the read range lies outside of the buffer extents.

### Example

```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof("int"))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("int") - 1 do
    buffer:PokeInt(n * sizeof("int"), n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("int") - 1 do
    print(buffer:PeekInt(n * sizeof("int")))
end
```