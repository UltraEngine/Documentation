# Plane

A plane is an infinite flat surface in 3D space with a direction and distance from the origin.

| Property | Type | Description |
|---|---|---|
| x, y, z | float | normal |
| d | float | distance from the origin |
| Plane | Constructor | Plane(const float x, const float y, const float z, const float d) |
| Plane | Constructor | Plane(const [Vec3](Vec3.md) point, const [Vec3](Vec3.md) normal) |
| Plane | Constructor | Plane(const [Vec3](Vec3.md) a, const [Vec3](Vec3.md) b, const [Vec3](Vec3.md) c) |
| [DistanceToPoint](Plane_DistanceToPoint.md) | Method | gets the shortest distance between the plane and a point |
| [IntersectsLine](Plane_IntersectsLine.md) | Method | test if the plane intersects a line or line segment |
