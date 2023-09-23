# Aabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| Aabb | Constructor | Aabb() |
| Aabb | Constructor | Aabb([Vec3](Vec3.md) min, [Vec3](Vec3.md) max) |
| Aabb | Constructor | Aabb(number x0, number y0, number z0, number x1, number y1, number z1) |
| min | [Vec3](Vec3.md) | Minimum extent of the bounding box. |
| max | [Vec3](Vec3.md) | Maximum extent of the bounding box. |
| center | [Vec3](Vec3.md) | Halfway point between the minimum and maximum extents |
| size | [Vec3](Vec3.md) | Distance between the minimum and maximum extents |
| radius | number | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one Aabb to enclose another. |
| + | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](Aabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
