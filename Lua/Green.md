# Green

Extracts the green component from a packed [RGBA](Rgba.md) value.

## Syntax

```lua
function Green(rgba: number): number
```

## Returns

Returns the green component of the color.

## Example

```lua
local color = Rgba(220, 64, 128, 255)

Print(Red(color))
Print(Green(color))
Print(Blue(color))
Print(Alpha(color))
```