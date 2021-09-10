# Entity::GetRotation

This method retrieves the entity's rotation.

## Syntax

- [xVec3](xVec3.md) **GetRotation**(const bool global  = false)

| Parameter | Description |
| --- | --- |
| global | if set to true the global rotation is returned, otherwise local space is used |

## Returns

Returns this entity's rotation as a Euler angle, in local or global space.
