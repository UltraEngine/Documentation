# Plane

A plane is an infinite flat surface in 3D space with a direction and distance from the origin.

| Property | Type | Description |
|---|---|---|
| x, y, z | float | normal |
| d | float | distance from the origin |
| Plane | Constructor | Plane(float x, float y, float z, float d) |
| Plane | Constructor | Plane(Vec3 point, Vec3 normal) |
| Plane | Constructor | Plane(Vec3 a, Vec3 b, Vec3 c) |
| [DistanceToPoint](Plane_DistanceToPoint.md) | Method | gets the shortest distance between the plane and a point |
| [IntersectsLine](Plane_IntersectsLine.md) | Method | test if the plane intersects a line or line segment |

**Example:** Plane in C#

```csharp
Plane plane = new Plane(x, y, z, d);
Plane plane = new Plane(point, normal);
Plane plane = new Plane(a, b, c);

float distance = plane.DistanceToPoint(point);
bool intersects = plane.IntersectsLine(startPoint, endPoint);
```