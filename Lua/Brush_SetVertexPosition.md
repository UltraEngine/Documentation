# Brush: SetVertexPosition

This method sets a brush vertex position.

## Syntax

- **SetVertexPosition**(v: number, x: number, y: number, z: number): void
- **SetVertexPosition**(v: number, position: [Vec3](#Vec3)): void

### Parameters

- **v**: The vertex index to set.
- **position** or **(x, y, z)**: The position to set.

## Example

```lua
-- Set vertex position using individual coordinates
brush:SetVertexPosition(0, 1.0, 2.0, 3.0)

-- Set vertex position using a Vec3 object
local position = Vec3(1.0, 2.0, 3.0)
brush:SetVertexPosition(0, position)
```