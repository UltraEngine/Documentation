# Entity:SetRotation

This method sets the rotation of an entity in 3-dimensional space, using local or global space.

## Syntax

- **Entity:SetRotation**(rotation: xQuat, global: boolean = false)
- **Entity:SetRotation**(rotation: xVec3, global: boolean = false)
- **Entity:SetRotation**(pitch: number, yaw: number, roll: number, global: boolean = false)

**Parameters:**

- `rotation`, `xQuat`: the rotation to set, either as a Euler or quaternion. You can refer to the [`xQuat`](xQuat.md) documentation for more information.
- `rotation`, `xVec3`: the rotation to set, either as a Euler or quaternion. You can refer to the [`xVec3`](xVec3.md) documentation for more information.
- `pitch`, `yaw`, `roll`: the Euler angles representing the rotation.
- `global`: indicates whether the rotation should be set in global or local space.

## Remarks

An entity can be rotated in local or global space. Local space is relative to the entity's parent space. If the entity does not have a parent, local and global rotation are the same.

The engine uses a left-handed rotation system. Positive pitch turns an object down. Positive yaw turns to the right. Positive roll rolls to the left.