# Plane.IntersectsLine

This method tests if the plane intersects a line or line segment.

## Syntax

```csharp
bool IntersectsLine(Vec3 p0, Vec3 p1, out Vec3 result, bool twosided = false, bool infinite = false)
```

| Parameter | Description |
|---|---|
| p0 | starting point |
| p1 | end point |
| result | storage for intersection point |
| twosided | if true the plane will be considered two-sided and the direction of the line will not matter |
| infinite | if true then an infinite line will be tested, otherwise only the line segment will be tested |

## Returns

If the line intersects the plane true is returned and the intersection point is stored in result, otherwise false is returned.

## Example

```csharp
Vec3 p0 = new Vec3(0, 0, 0);
Vec3 p1 = new Vec3(1, 1, 1);
Vec3 intersectionPoint;

bool intersects = IntersectsLine(p0, p1, out intersectionPoint);
if (intersects)
{
    Console.WriteLine("Line intersects the plane.");
    Console.WriteLine("Intersection point: " + intersectionPoint);
}
else
{
    Console.WriteLine("Line does not intersect the plane.");
}
```