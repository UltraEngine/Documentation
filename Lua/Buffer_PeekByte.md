# Buffer:PeekByte #
This method returns a single byte from the memory buffer.

## Syntax ##
`unsigned char Buffer:PeekByte(uint64_t pos)`

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a byte value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof("char"))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("char") do
    buffer:PokeByte(n, n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("char") do
    print(buffer:PeekByte(n))
end
```