# Bone

Base class: [Object](Object.md)

A bone is an articulation in a [Skeleton](Skeleton.md). Mesh vertices can be attached to bones for skinned animation. Although bones have a position and rotation in 3D space, bones are a more lightweight object than the [Entity](Entity.md) class.

You can attach an entity to a bone with the [Entity::Attach](Entity_Attach.md) method.

| Property | Type | Description |
|---|---|---|
| [GetMatrix](Bone_GetMatrix.md) | Method | gets the bone 4x4 matrix |
| [GetPosition](Bone_GetPosition.md) | Method | gets the bone position |
| [GetRotation](Bone_GetRotation.md) | Method | gets the bone rotation |
| [GetScale](Bone_GetScale.md) | Method | gets the bone uniform scale |
| [SetMatrix](Bone_SetMatrix.md) | Method | manually sets the bone matrix |
| [SetPosition](Bone_SetPosition.md) | Method | manually sets the bone position |
| [SetRotation](Bone_SetRotation.md) | Method | manually sets the bone rotation |
| [SetScale](Bone_SetScale.md) | Method | manually sets the bone uniform scale |
| [Turn](Bone_Turn.md) | Method | manually turns the bone | 
