# Entity::SetColor

This method can be used to colorize a visible entity such as a model or light.

## Syntax

- void **SetColor**(color: [Vec4](Vec4.md), recursive: boolean = false): void
- void **SetColor**(r: number, g: number, b: number, a: number = 1, recursive: boolean = false): void
- void **SetColor**(luminance: number, recursive: boolean = false): void

## Parameters

| Parameter | Description |
| ---- | ---- |
| color | RGBA color to set |
| r | red component of the color to set |
| g | green component of the color to set |
| b | blue component of the color to set |
| a | alpha component of the color to set |
| luminance | RGB brightness to set |
| recursive | if set to true the entity subhierarchy will also be affected |

## Example

```lua
-- Using RGBA color
local color = Vec4(1, 0, 0, 1) -- Red color
entity:SetColor(color, true)

-- Using separate color components
entity:SetColor(1, 0, 0, 1, true) -- Red color

-- Using RGB brightness
entity:SetColor(0.5, true) -- Set brightness to 0.5
```