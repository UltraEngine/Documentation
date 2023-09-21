# Aabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ---- | ---- | ---- |
| Aabb | Constructor | Aabb() |
| Aabb | Constructor | Aabb(min: Vec3, max: Vec3) |
| Aabb | Constructor | Aabb(x0: number, y0: number, z0: number, x1: number, y1: number, z1: number) |
| min | Vec3 | Minimum extent of the bounding box. |
| max | Vec3 | Maximum extent of the bounding box. |
| center | Vec3 | Halfway point between the minimum and maximum extents |
| size | Vec3 | Distance between the minimum and maximum extents |
| radius | number | Radius of a sphere that completely encloses the bounding box. |
| \+= | Operator | Expands one Aabb to enclose another. |
| \+ | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](Aabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
