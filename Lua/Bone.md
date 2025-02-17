# Bone

Base class: [Object](Object.md)

A bone is an articulation in a Skeleton. Mesh vertices can be attached to bones for skinned animation. Although bones have a position and rotation in 3D space, bones are a more lightweight object than the Entity class.

You can attach an entity to a bone with the Entity:Attach() method.

| Property | Type | Description |
|---|---|---|
| id | number | read-only bone index for vertex skinning |
| name | [string](https://www.lua.org/manual/5.4/manual.html#6.4) | bone name |
| [GetPosition](Bone_GetPosition.md) | Method | gets the bone position |
| [GetRotation](Bone_GetRotation.md) | Method | gets the bone rotation |
| [GetScale](Bone_GetScale.md) | Method | gets the bone uniform scale |
| [SetPosition](Bone_SetPosition.md) | Method | manually sets the bone position |
| [SetRotation](Bone_SetRotation.md) | Method | manually sets the bone rotation |
| [SetScale](Bone_SetScale.md) | Method | manually sets the bone uniform scale |
| [Turn](Bone_Turn.md) | Method | manually turns the bone |
