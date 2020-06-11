# Entity::GetRotation #
This method retrieves the entity's rotation.

## Syntax ##
- [Vec3](CPP_Vec3.md) **GetRotation**(const bool global  = false)

## Parameters ##
| Name | Description |
| --- | --- |
| global | if set to true the global rotation is returned, otherwise local space is used |

## Returns ##
Returns this entity's rotation as a Euler angle, in local or global space.
