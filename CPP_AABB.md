# AABB #

This class describes an axis-aligned bounding box.

## Members ##
| Name | Description |
| ----- | ----- |
| [Vec3](CPP_Vec3.md) min | Minimum extent of the bounding box. |
| [Vec3](CPP_Vec3.md) max | Maximum extent of the bounding box. |
| [Vec3](CPP_Vec3.md) center | Halfway point between the minimum and maximum extents |
| [Vec3](CPP_Vec3.md) size | Distance between the minimum and maximum extents |
| float radius | Radius of a sphere that complete encloses the bounding box. |

##Constructors ##
| Constructor |
| --- |
| **AABB**() |
| **AABB**(const [Vec3](CPP_Vec3.md)& min, const [Vec3](CPP_Vec3.md)& max) |
| **AABB**(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1) |

## Methods ##
| Name | Description |
| ----- | ----- |
| [Update](API_AABB_Update.md) | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |
