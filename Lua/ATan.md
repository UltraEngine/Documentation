# atan

This function returns the arc tangent of the specified value.

## Syntax

- number **ATan**(number value)
- number **ATan**(number y, number x)

| Parameter | Description |
| --- | --- |
| value | tangent value |
| y | Y component of the vector |
| x | X component of the vector |

## Returns

Returns the arc tangent, or the angle given by the vector XY.

## Example

```lua
angle = -65.0

s = Sin(angle)
c = Cos(angle)
t = Tan(angle)

Print("Sin: " .. ASin(s))
Print("Cos: " .. ACos(c))
Print("Tan: " .. ATan(t))
```
