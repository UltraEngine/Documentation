# Red
Extracts the red component from a packed [RGBA](Rgba.md) value.

## Syntax

`unsigned char Red(unsigned int rgba)`

## Returns

Returns the red component of the color.

## Example

```lua
color = Rgba(220,64,128,255)

Print(Red(color))
Print(Green(color))
Print(Blue(color))
Print(Alpha(color))
```