# Entity::SetRotation

This method sets the rotation of an entity in 3-dimensional space, using local or global space.

## Syntax

- void **SetRotation**(const [xQuat](xQuat.md)& rotation, const bool global = false)
- void **SetRotation**(const [xVec3](xVec3.md)& rotation, const bool global = false)
- void **SetRotation**(const dFloat pitch, const dFloat yaw, const dFloat roll, const bool global = false)

| Parameter | Description |
| ------ | ------ |
| rotation, (pitch, yaw, roll) | the rotation to set, either as a Euler or quaternion |
| global | indicates whether the rotation should be set in global or local space |

## Remarks

An entity can be rotated in local or global space. Local space is relative to the entity parent's space. If the entity does not have a parent, local and global rotation is the same.

The engine uses a left-handed rotation system. Positive pitch turns an object down. Positive yaw turns to the right. Positive roll rolls to the left.
