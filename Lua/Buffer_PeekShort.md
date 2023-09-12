# buffer:peekShort
This function returns a short integer from the memory buffer.

## Syntax
```lua
function buffer:peekShort(pos: number): number
```

## Parameters
| Parameter | Description |
| --- | --- |
| pos | offset from the start of the buffer, in bytes |

## Returns
Returns a short integer value.

## Remarks
A runtime error will occur if the read range lies outside of the buffer extents.

## Example
```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof("short"))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("short") - 1 do
    buffer:PokeShort(n * sizeof("short"), n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("short") - 1 do
    print(buffer:PeekShort(n * sizeof("short")))
end
```