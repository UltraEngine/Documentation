# World::Pick

This method performs a line segment intersection test on all the entities in the world.

## Syntax

- [PickInfo](PickInfo.md) **Pick**(const [xVec3](xVec3.md)& p0, const [xVec3](xVec3.md)& p1, const dFloat radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)
- [PickInfo](PickInfo.md) **Pick**(const dFloat x0, const dFloat y0, const dFloat z0, const dFloat x1, const dFloat y1, const dFloat z1, const dFloat radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)

| Parameter | Description |
| --- | --- |
| p0, (x0, y0, z0) | line start position |
| p1, (x1, y1, z1) | line end position |
| radius | if greater than zero a swept sphere intersection test will be performed |
| closest | if set to true the closest intersected point will be found, otherwise the routine will return on the first hit |
| collisiontype | optional collision type filter |

## Returns

If the line segment intersects the entity, the resulting PickInfo's *success* member will be set to true, otherwise it will be false.
