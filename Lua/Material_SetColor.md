# Material:SetColor

This method sets the material color.

## Syntax

- **SetColor**(color: [Vec4](#vec4))
- **SetColor**(r: number, g: number, b: number, a: number)

#### Parameters

- `color, (r, g, b, a)`: The color to set.

## Example

```lua
local material = Material()

-- Using Vec4 parameter
local colorVec = Vec4(1, 0.5, 0, 1)
material:SetColor(colorVec)

-- Using separate RGBA parameters
material:SetColor(0.5, 0, 0.5, 0.75)
```