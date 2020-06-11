# Entity::Pick #
This method performs a ray intersection test on the entity.

## Syntax (32f) ##
- bool **Pick**(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)
- bool **Pick**(const Vec3& p0, const Vec3& p1, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)

## Syntax (64f) ##
- bool **Pick**(const double x0, const double y0, const double z0, const double x1, const double y1, const double z1, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)
- bool **Pick**(const dVec3& p0, const dVec3& p1, PickInfo& pickinfo, const float radius = 0.0, const bool closest = false, const CollisionType collisiontype = COLLISION_NONE)

### Parameters ###
| Name | Description |
| --- | --- |
| **x0** | x component of the ray start position |
| **y0** | y component of the ray start position |
| **z0** | z component of the ray start position |
| **x1** | x component of the ray end position |
| **y1** | y component of the ray end position |
| **z1** | z component of the ray end position |
| **p0** | ray start position |
| **p1** | ray end position |
| **pickinfo** | structure containing information about the ray intersection result |
| **radius** | if greater than zero a swept sphere intersection test will be performed |
| **closest** | if set to true the closest intersected point will be found, otherwise the routine will return on the first hit |
| **recursive** | if set to true the entity subhierarchy will be tested |
| **collisiontype** | optional collision type filter |

# Returns #
If the ray intersects the entity, the PickInfo structure is filled in and true is returned, otherwise false is returned.
