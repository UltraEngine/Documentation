# Buffer.PokeFloat
This method inserts a float value into the memory buffer.

## Syntax
`Buffer:PokeFloat(pos, f)`

## Parameters
- `pos` (number): offset from the start of the buffer, in bytes
- `f` (number): value to insert

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example

```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof "float")

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof "float" - 1 do
    buffer:PokeFloat(n * sizeof "float", n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof "float" - 1 do
    Print(buffer:PeekFloat(n * sizeof "float"))
end
```