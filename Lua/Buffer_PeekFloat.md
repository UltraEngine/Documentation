# buffer:peekFloat
This method returns a float value from the memory buffer.

## Syntax
```lua
float buffer:peekFloat(pos)
```

### Parameters
- `pos`: offset from the start of the buffer, in bytes

## Returns
Returns a float value.

## Remarks
A runtime error will occur if the read range lies outside of the buffer extents.

## Example

```lua
--Create a buffer
local buffer = CreateBuffer(20 * sizeof("float"))

--Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("float") - 1 do
    buffer:PokeFloat(n * sizeof("float"), n + 1)
end

--Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("float") - 1 do
    Print(buffer:PeekFloat(n * sizeof("float")))
end
```