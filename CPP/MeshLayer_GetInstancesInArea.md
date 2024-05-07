# MeshLayer::GetInstancesInArea

This method retrieves a list of all instances that occur within the specified bounding box or 2D area.

## Syntax

- vector<[iVec2](iVec2.md)> **GetInstancesInArea**(const [Vec3](Vec4.md)& area)
- vector<[iVec2](iVec2.md)> **GetInstancesInArea**(const float x, const float z, const float radius)
- vector<[iVec2](iVec2.md)> **GetInstancesInArea**(const [Aabb](Aabb.md)& bounds)

| Parameter | Description |
|---|---|
| area | an area in world coordinates |
| x, z, radius | a circular area in world coordinates |
| bounds | an axis-aligned bounding box |

## Returns

Returns a list of all instances that intersect the specified area. Each element of the returned array specifies the X and Y coordinate of a valid instance.
