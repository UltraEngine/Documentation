# Aabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| Aabb | Constructor | Aabb() |
| Aabb | Constructor | Aabb(const [Vec3](Vec3.md)& min, const [Vec3](Vec3.md)& max) |
| Aabb | Constructor | Aabb(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1) |
| min | [Vec3](Vec3.md) | Minimum extent of the bounding box. |
| max | [Vec3](Vec3.md) | Maximum extent of the bounding box. |
| center | [Vec3](Vec3.md) | Halfway point between the minimum and maximum extents |
| size | [Vec3](Vec3.md) | Distance between the minimum and maximum extents |
| radius | float | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one Aabb to enclose another. |
| + | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](Aabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
