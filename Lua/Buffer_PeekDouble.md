# Buffer:PeekDouble #
This method returns a double float value from the memory buffer.

## Syntax ##
```
double Buffer:PeekDouble(uint64_t pos)
```

### Parameters ###
| Name | Description |
| ----- | ----- |
| pos | offset from the start of the buffer, in bytes |

## Returns ##
Returns a double float value.

## Remarks ##
A runtime error will occur if the read range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.

## Example

```lua
-- Create a buffer
local buffer = CreateBuffer(20 * sizeof(double))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof(double) - 1 do
    buffer:PokeDouble(n * sizeof(double), n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof(double) - 1 do
    Print(buffer:PeekDouble(n * sizeof(double)))
end
```