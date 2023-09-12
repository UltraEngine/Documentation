# Buffer: PokeByte
This function inserts a single byte into a memory buffer.

## Syntax
- **Buffer: PokeByte**(pos: number, b: number)

| Parameter | Description |
| -------- | ----------- |
| pos | The offset from the start of the buffer, in bytes. |
| b | The value to insert. |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof(char))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof(char) - 1 do
	buffer:PokeByte(n, n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof(char) - 1 do
	Print(buffer:PeekByte(n))
end
```