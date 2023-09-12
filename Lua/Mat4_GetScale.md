# Mat4:GetScale

This method returns the matrix scale.

### Syntax

```lua
function Mat4:GetScale()
```

### Returns

Returns the matrix scale as a `Vec3` object.

## Example

```lua
-- Create a matrix
local matrix = Mat4()

-- Scale the matrix
matrix:Scale(Vec3(2, 3, 4))

-- Get the scale of the matrix
local scale = matrix:GetScale()

print("Matrix scale:", scale)
```