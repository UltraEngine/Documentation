# Green

Extracts the blue component from a packed [RGBA](Rgba.md) value.

## Syntax

- number **Blue**(number rgba)

Parameter | Description 
---|---
rgba | The packed [RGBA](Rgba.md) value.

## Returns

Returns the blue component of the color.

## Example

```lua
local color = Rgba(220, 64, 128, 255)

Print(Red(color))
Print(Green(color))
Print(Blue(color))
Print(Alpha(color))
```
