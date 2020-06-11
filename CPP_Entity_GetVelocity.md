# Entity::GetVelocity #
This method retrieves the entity velocity, in global or local space.

## Syntax (32f) ##
- [Vec3](CPP_Vec3.md) **GetVelocity**(const bool global = true)

## Syntax (64f) ##
- [dVec3](CPP_dVec3.md) **GetVelocity**(const bool global = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **global** | if set to true global space is used, otherwise local space is used |

## Returns ##
Returns the entity's velocity, in meters per second.
