# Entity::Pick #
The first overload of this method will perform a ray intersection test on the entity's world, between the entity's global position and a position directly in front of the entity. The second two overloads will perform a ray intersection test on the entity itself, using the specific points as the ends of the line.

## Syntax ##
- bool **Pick**(const float distance, [PickInfo](CPP_PickInfo_32f.md)& pickinfo, const float radius = 0.0, const bool closest = false, const bool recursive = false, const [CollisionType](CPP_Constants.md) collisiontype = COLLISION_NONE)
- bool **Pick**(const float x0, const float y0, const float z0, const float x1, const float y1, const float z1, [PickInfo](CPP_PickInfo_32f.md)& pickinfo, const float radius = 0.0, const bool closest = false, const bool recursive = false, const [CollisionType](CPP_Constants.md) collisiontype = COLLISION_NONE)
- bool **Pick**(const [Vec3](CPP_Vec3.md)& p0, const [Vec3](CPP_Vec3.md)& p1, [PickInfo](CPP_PickInfo_32f.md)& pickinfo, const float radius = 0.0, const bool closest = false, const bool recursive = false, const [CollisionType](CPP_Constants.md) collisiontype = COLLISION_NONE)

### Parameters ###
| Name | Description |
| --- | --- |
| **distance** | ray distance projected in front of entity, in global space. |
| **x0** | x component of the ray start position |
| **y0** | y component of the ray start position |
| **z0** | z component of the ray start position |
| **x1** | x component of the ray end position |
| **y1** | y component of the ray end position |
| **z1** | z component of the ray end position |
| **p0** | ray start position, in local space |
| **p1** | ray end position, in local space |
| **pickinfo** | structure containing information about the ray intersection result |
| **radius** | if greater than zero a swept sphere intersection test will be performed |
| **closest** | if set to true the closest intersected point will be found, otherwise the routine will return on the first hit |
| **recursive** | if set to true the entity subhierarchy will be tested |
| **collisiontype** | optional collision type filter |

# Returns #
If the ray intersects the entity, the PickInfo structure is filled in and true is returned, otherwise false is returned. If the first overload of the method is used, the entity itself will be excluded from the ray intersection test, regardless of its current pick mode.
