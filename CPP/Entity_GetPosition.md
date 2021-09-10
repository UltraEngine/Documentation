# Entity::GetPosition

This method returns the entity position.

## Syntax

- [xVec3](xVec3.md) **GetPosition**(const bool global  = false)

| Parameter | Description |
|---|---|
| global | if set to false the position will be returned relative to the parent, otherwise the position in world space will be returned |


## Returns

Returns this entity's position, in parent or world space.
