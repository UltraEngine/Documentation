# Plane

A plane is an infinite flat surface in 3D space with a direction and distance from the origin.

| Property | Type | Description |
|---|---|---|
| x, y, z | number | normal |
| d | number | distance from the origin |
| Plane | Constructor | Plane(number x, number y, number z, number d) |
| Plane | Constructor | Plane([Vec3](Vec3.md) point, [Vec3](Vec3.md) normal) |
| Plane | Constructor | Plane([Vec3](Vec3.md) a, [Vec3](Vec3.md) b, [Vec3](Vec3.md) c) |
| [DistanceToPoint](Plane_DistanceToPoint.md) | Method | gets the shortest distance between the plane and a point |
| [IntersectsLine](Plane_IntersectsLine.md) | Method | test if the plane intersects a line or line segment |
