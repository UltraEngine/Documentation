# Plane::IntersectsLine

This method tests if the plane intersects a line or line segment.

## Syntax

- bool **IntersectsLine**(const [Vec3](Vec3.md)& p0, const [Vec3](Vec3.md)& p1, [Vec3](Vec3.md)& result, const bool twosided = false, const bool infinite = false)

| Parameter | Description |
|---|---|
| p0 | starting point |
| p1 | end point |
| result | storage for intersection point |
| twosided | if true the plane will be considered two-sided and the direction of the line will not matter |
| infinite | if true then an infinite line will be tested, otherwise only the line segment will be tested |

## Returns

If the line intersects the plane true is returned and the intersection point is stored in result, otherwise false is returned.
