# mesh:GetVertexColor

This method returns the color of the specified mesh vertex.

## Syntax

```lua
function mesh:GetVertexColor(index)
```

## Parameters

- `index` - The index of the vertex.

## Returns

Returns the vertex color as a `Vec4` object.

## Example

```lua
local color = mesh:GetVertexColor(0)
print(color)
```