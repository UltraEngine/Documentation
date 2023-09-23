# dAabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| dAabb | Constructor | dAabb() |
| dAabb | Constructor | dAabb([dVec3](dVec3.md) min, [dVec3](dVec3.md) max) |
| dAabb | Constructor | dAabb(number x0, const number y0, const number z0, const number x1, const number y1, const number z1) |
| min | [dVec3](dVec3.md) | Minimum extent of the bounding box. |
| max | [dVec3](dVec3.md) | Maximum extent of the bounding box. |
| center | [dVec3](dVec3.md) | Halfway point between the minimum and maximum extents |
| size | [dVec3](dVec3.md) | Distance between the minimum and maximum extents |
| radius | double | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one Aabb to enclose another. |
| + | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](dAabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
