# AABB #
This class describes an axis-aligned bounding box.

## Members ##
- [Vec3](CPP_Vec3.md) min
- [Vec3](CPP_Vec3.md) max
- [Vec3](CPP_Vec3.md) center
- [Vec3](CPP_Vec3.md) size
- float radius

## Constructors ##
- **AABB**()
- **AABB**(const [Vec3](CPP_Vec3.md)& min, const [Vec3](CPP_Vec3.md)& max)
- **AABB**(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1)

## Methods ##
- [Update](API_AABB_Update.md)
