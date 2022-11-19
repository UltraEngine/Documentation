# Brush::Slice

This method will slice a brush in half along a plane and return the two resulting pieces. The original brush will be unharmed.

## Syntax

- std::vector<shared_ptr<[Brush](Brush.md) \> \> **Slice**(const [Plane](Plane.md)& plane, shared_ptr<[Face](Face)> sliceface = NULL, const float tolerance = 0.001)

| Parameter | Description |
|---|---|
| plane | slice plane |
| tolerance | error tolerance, should be greater than zero |
| sliceface | if provided, material and texture mapping settings will be copied from this face to the end caps of the resulting brushes. This is useful for boolean operations, where one brush carves a volume out of another.

## Returns

If the plane does not intersect the brush, the returned array will be of length zero. Otherwise, the returned array will contain two resulting brushes.
