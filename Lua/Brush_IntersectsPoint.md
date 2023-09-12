# Brush:IntersectsPoint

This method tests to see if a point in space is inside or outside of a brush.

## Syntax

```lua
function Brush:IntersectsPoint(point: xVec3, padding: number): boolean
```

## Parameters

- `point` (xVec3): position in global space to test
- `padding` (number): brush face padding (optional)

## Returns

Returns true if the point is inside the brush, otherwise false is returned.

## Remarks

The optional `padding` value acts as if the brush faces are being moved forward by that amount, making the brush volume larger. This is not exactly the same thing as a radius around the point.