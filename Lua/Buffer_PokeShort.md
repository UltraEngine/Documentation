# buffer:PokeShort
This method inserts a single short integer into a memory buffer.

## Syntax
```lua
function buffer:PokeShort(pos, i)
```

## Parameters
| Parameter | Description |
| ----- | ----- |
| **pos** | offset from the start of the buffer, in bytes |
| **i** | value to insert |

## Remarks
A runtime error will occur if the destination range lies outside of the buffer extents.

## Example
```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof("short"))

-- Poke data to the buffer
for n=0, buffer:GetSize() / sizeof("short") - 1 do
    buffer:PokeShort(n * sizeof("short"), n + 1)
end

-- Peek and display data from the buffer
for n=0, buffer:GetSize() / sizeof("short") - 1 do
    Print(buffer:PeekShort(n * sizeof("short")))
end
```