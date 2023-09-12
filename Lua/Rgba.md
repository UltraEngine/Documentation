# Rgba

This function combines four 8-bit color channels into a single packed RGBA color.

## Syntax

```lua
function Rgba(r: number, g: number, b: number, a: number): number
```

## Parameters

| Parameter | Description |
| --- | --- |
| r | red component |
| g | green component |
| b | blue component |
| a | alpha component (default = 255) |

## Returns

Returns an RGBA color packed into a single integer. The individual color channel values can be extracted with the [Red](Red)_, [Green](Green), [Blue](Blue), and [Alpha](Alpha) functions.

## Example

```lua
color = Rgba(220, 64, 128, 255)

Print(Red(color))
Print(Green(color))
Print(Blue(color))
Print(Alpha(color))
```