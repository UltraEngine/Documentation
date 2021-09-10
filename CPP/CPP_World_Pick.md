# World::Pick

This method performs a ray intersection test on the world.

## Syntax

- bool **Pick**(const dFloat x0, const dFloat y0, const dFloat z0, const dFloat x1, const dFloat y1, const dFloat z1, [PickInfo](PickInfo_32f.md)& pickinfo, const dFloat radius = 0.0, const bool closest = false, const [CollisionType](Constants.md) collisiontype = COLLISION_NONE)
- bool **Pick**(const [xVec3](xVec3.md)& p0, const [xVec3](xVec3.md)& p1, [PickInfo](PickInfo.md)& pickinfo, const dFloat radius = 0.0, const bool closest = false, const [CollisionType](Constants.md) collisiontype = COLLISION_NONE)

| Parameter | Description |
| --- | --- |
| p0 | ray start position, in local space |
| p1 | ray end position, in local space |
| x0 | X component of the ray start position |
| y0 | Y component of the ray start position |
| z0 | Z component of the ray start position |
| x1 | X component of the ray end position |
| y1 | Y component of the ray end position |
| z1 | Z component of the ray end position |
| pickinfo | structure containing information about the ray intersection result |
| radius | if greater than zero a swept sphere intersection test will be performed |
| closest | if set to true the closest intersected point will be found, otherwise the routine will return on the first hit |
| collisiontype | optional collision type filter |

# Returns

If the ray intersects the entity, the PickInfo structure is filled in and true is returned, otherwise false is returned.
