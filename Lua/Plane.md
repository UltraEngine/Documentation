# Plane

A plane is an infinite flat surface in 3D space with a direction and distance from the origin.

### Properties
| Name | Type | Description |
|---|---|---|
| x, y, z | number | normal |
| d | number | distance from the origin |

### Constructors
* Plane(x: number, y: number, z: number, d: number): Creates a plane with the given normal and distance from the origin.
* Plane(point: Vec3, normal: Vec3): Creates a plane using a point on the plane and its normal vector.
* Plane(a: Vec3, b: Vec3, c: Vec3): Creates a plane using three non-collinear points on the plane.

### Methods
* [DistanceToPoint](Plane_DistanceToPoint.md)(point: Vec3): Returns the shortest distance between the plane and a given point.
* [IntersectsLine](Plane_IntersectsLine.md)(start: Vec3, end: Vec3): Tests if the plane intersects a line defined by the given start and end points.