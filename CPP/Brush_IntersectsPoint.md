# Brush::IntersectsPoint

This method tests to see if a point in space is inside or outside of a brush.

## Syntax

- bool **IntersectsPoint**(const [xVec3](xVec3.md)& point, const dFloat padding = 0)

| Parameter | Description |
|---|---|
| point | position in global space to test |
| padding | brush face padding |

## Returns

Returns true if the point is inside the brush, otherwise false is returned.

## Remarks

The optional padding value acts as if the brush faces are being moved forward by that amount, making the brush volume larger. This is not exactly the same thing as a radius around the point.
