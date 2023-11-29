# dAabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| dAabb | Constructor | dAabb() |
| dAabb | Constructor | dAabb(const [dVec3](dVec3.md)&amp; min, const [dVec3](dVec3.md)&amp; max) |
| dAabb | Constructor | dAabb(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1) |
| min | [dVec3](dVec3.md) | Minimum extent of the bounding box. |
| max | [dVec3](dVec3.md) | Maximum extent of the bounding box. |
| center | [dVec3](dVec3.md) | Halfway point between the minimum and maximum extents |
| size | [dVec3](dVec3.md) | Distance between the minimum and maximum extents |
| radius | float | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one dAabb to enclose another. |
| + | Operator | Expands one dAabb to enclose another and returns the result. |
| [Update](dAabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |


### Example

```csharp
dAabb aabb = new dAabb(new dVec3(x0, y0, z0), new dVec3(x1, y1, z1));

dVec3 min = aabb.min;
dVec3 max = aabb.max;
dVec3 center = aabb.center;
dVec3 size = aabb.size;
float radius = aabb.radius;

aabb += new dAabb(min, max);
dAabb result = aabb + new dAabb(min, max);

aabb.Update();
```