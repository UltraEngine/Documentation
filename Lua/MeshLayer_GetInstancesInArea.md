# MeshLayer::GetInstancesInArea

This method retrieves a list of all instances that occur within the specified bounding box or 2D area.

## Syntax

- vector<[iVec2](iVec2.md)> **GetInstancesInArea**(const [Aabb](Aabb.md)& bounds)

| Parameter | Description |
|---|---|
| bounds | an axis-aligned bounding box |

## Returns

Returns an array of all instances that intersect the specified area. Each element of the returned array specifies the X and Y coordinate of a valid instance.
