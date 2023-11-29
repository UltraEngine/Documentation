# Bone

Base class: [Object](Object.md)

A bone is an articulation in a [Skeleton](Skeleton.md). Mesh vertices can be attached to bones for skinned animation. Although bones have a position and rotation in 3D space, bones are a more lightweight object than the [Entity](Entity.md) class.

You can attach an entity to a bone with the [Entity.Attach](Entity_Attach.md) method.

| Property | Type | Description |
|---|---|---|
| id | const int | read-only bone index for vertex skinning |
| [GetPosition](Bone_GetPosition.md) | Method | gets the bone position |
| [GetRotation](Bone_GetRotation.md) | Method | gets the bone rotation |
| [GetScale](Bone_GetScale.md) | Method | gets the bone uniform scale |
| [SetPosition](Bone_SetPosition.md) | Method | manually sets the bone position |
| [SetRotation](Bone_SetRotation.md) | Method | manually sets the bone rotation |
| [SetScale](Bone_SetScale.md) | Method | manually sets the bone uniform scale |
| [Turn](Bone_Turn.md) | Method | manually turns the bone | 

## Example

```csharp
// Get the position of the bone
Vector3 position = bone.GetPosition();

// Set the rotation of the bone
Quaternion rotation = new Quaternion(0, 0, 0, 1);
bone.SetRotation(rotation);
```
