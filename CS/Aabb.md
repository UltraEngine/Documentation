# Aabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ----- | ----- | ----- |
| Aabb | Constructor | Aabb() |
| Aabb | Constructor | Aabb(Vec3 min, Vec3 max) |
| Aabb | Constructor | Aabb(float x0, float y0, float z0, float x1, float y1, float z1) |
| min | Vec3 | Minimum extent of the bounding box. |
| max | Vec3 | Maximum extent of the bounding box. |
| center | Vec3 | Halfway point between the minimum and maximum extents |
| size | Vec3 | Distance between the minimum and maximum extents |
| radius | float | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one Aabb to enclose another. |
| + | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](Aabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |

## Example

```csharp
Aabb box1 = new Aabb(new Vec3(0, 0, 0), new Vec3(2, 2, 2));
Aabb box2 = new Aabb(new Vec3(1, 1, 1), new Vec3(3, 3, 3));

// Expand box1 to enclose box2
box1 += box2;
```

Note: The above example assumes there is a `Vec3` class available.