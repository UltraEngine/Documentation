# TextureBuffer:GetSize

This method returns the texture buffer dimensions.

## Syntax

`size = TextureBuffer:GetSize()`

## Returns

- `size` (table): The texture buffer size represented by a table with `x` and `y` components.

## Example

```lua
-- Create a texture buffer
local buffer = TextureBuffer()

-- Get the size of the texture buffer
local size = buffer:GetSize()

-- Print the dimensions
print(size.x, size.y)
```

Output:
```
1024 768
```