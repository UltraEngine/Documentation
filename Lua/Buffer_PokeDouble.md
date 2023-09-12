# buffer:pokeDouble
This method inserts a double float value into the memory buffer.

### Syntax
```lua
buffer:pokeDouble(pos, f)
```

__Parameters:__
- `pos` : offset from the start of the buffer, in bytes
- `f` : value to insert

### Remarks
A runtime error will occur if the destination range lies outside of the buffer extents. Note that a double value is 8 bytes, twice the size of an int or float value.

### Example

```lua
-- Create a buffer
buffer = CreateBuffer(20 * sizeof("double"))

-- Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("double") - 1 do
    buffer:pokeDouble(n * sizeof("double"), n + 1)
end

-- Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("double") - 1 do
    Print(buffer:peekDouble(n * sizeof("double")))
end
```