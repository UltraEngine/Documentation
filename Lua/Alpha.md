# Alpha

Extracts the alpha component from a packed [RGBA](Rgba.md) value.

## Syntax

`local alpha = Alpha(rgba)`

## Parameters

- `rgba` (number): The packed [RGBA](Rgba.md) value.

## Returns

- `alpha` (number): The alpha component of the color.

## Example

```lua
local color = Rgba(220, 64, 128, 255)

print(Red(color))
print(Green(color))
print(Blue(color))
print(Alpha(color))
```