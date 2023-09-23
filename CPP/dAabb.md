# dAabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| dAabb | Constructor | dAabb() |
| dAabb | Constructor | dAabb(const [dVec3](dVec3.md)& min, const [dVec3](dVec3.md)& max) |
| dAabb | Constructor | dAabb(const double x0, const double y0, const double z0, const double x1, const double y1, const double z1) |
| min | [dVec3](dVec3.md) | Minimum extent of the bounding box. |
| max | [dVec3](dVec3.md) | Maximum extent of the bounding box. |
| center | [dVec3](dVec3.md) | Halfway point between the minimum and maximum extents |
| size | [dVec3](dVec3.md) | Distance between the minimum and maximum extents |
| radius | double | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one dAabb to enclose another. |
| + | Operator | Expands one dAabb to enclose another and returns the result. |
| [Update](dAabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
