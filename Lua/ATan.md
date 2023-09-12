# atan

This function returns the arc tangent of the specified value.

## Syntax

- **atan**(value: number): number
- **atan**(y: number, x: number): number

## Parameters

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

s = math.sin(math.rad(angle))
c = math.cos(math.rad(angle))
t = math.tan(math.rad(angle))

print("Sin: " .. math.deg(math.asin(s)))
print("Cos: " .. math.deg(math.acos(c)))
print("Tan: " .. math.deg(math.atan(t)))
```