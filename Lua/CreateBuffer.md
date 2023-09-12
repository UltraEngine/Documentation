# CreateBuffer

This function creates a new memory buffer object.

## Syntax

```lua
local buffer = CreateBuffer(size)
```

### Parameters

- **size**: size of the allocated memory block

### Returns

If the memory is allocated successfully, a new buffer object is returned. Otherwise, `nil` is returned.

## Example

```lua
--Create a buffer
local buffer = CreateBuffer(20 * sizeof("char"))

--Poke data to the buffer
for n = 0, buffer:GetSize() / sizeof("char") - 1 do
	buffer:PokeByte(n, n + 1)
end

--Peek and display data from the buffer
for n = 0, buffer:GetSize() / sizeof("char") - 1 do
	print(buffer:PeekByte(n))
end
```