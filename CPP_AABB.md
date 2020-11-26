# AABB #

This class describes an axis-aligned bounding box.

## Properties ##

| Name | Type | Description |
| ----- | ----- | ----- |
| AABB | Constructor | AABB() |
| AABB | Constructor | AABB(const [Vec3](CPP_Vec3.md)& min, const [Vec3](CPP_Vec3.md)& max) |
| AABB | Constructor | AABB(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1) |
| min | [Vec3](CPP_Vec3.md) | Minimum extent of the bounding box. |
| max | [Vec3](CPP_Vec3.md) | Maximum extent of the bounding box. |
| center | [Vec3](CPP_Vec3.md) | Halfway point between the minimum and maximum extents |
| size | [Vec3](CPP_Vec3.md) | Distance between the minimum and maximum extents |
| radius | float | Radius of a sphere that complete encloses the bounding box. |
| += | Operator | Expands one AABB to enclose another. |
| + | Operator | Expands one AABB to enclose another and returns the result. |
| [Update](API_AABB_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |

---
---
old version below...
---
---

## Constructors ##

- **AABB**()
- **AABB**(const [Vec3](CPP_Vec3.md)& min, const [Vec3](CPP_Vec3.md)& max)
- **AABB**(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1)

## Members ##
| Name | Description |
| ----- | ----- |
| [Vec3](CPP_Vec3.md) min | Minimum extent of the bounding box. |
| [Vec3](CPP_Vec3.md) max | Maximum extent of the bounding box. |
| [Vec3](CPP_Vec3.md) center | Halfway point between the minimum and maximum extents |
| [Vec3](CPP_Vec3.md) size | Distance between the minimum and maximum extents |
| float radius | Radius of a sphere that complete encloses the bounding box. |

## Methods ##
| Name | Description |
| ----- | ----- |
| [Update](API_AABB_Update.md) | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
