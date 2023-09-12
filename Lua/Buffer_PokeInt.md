#### Buffer:PokeInt
This method inserts a single integer into a memory buffer.

##### Syntax
- buffer:**PokeInt**(pos: number, i: number): void

| Parameter | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |
| i | value to insert |

##### Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

##### Example
```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof("int"))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("int") do
    buffer:PokeInt(n * sizeof("int"), n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("int") do
    Print(buffer:PeekInt(n * sizeof("int")))
end
```