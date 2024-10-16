# Skeleton

Base class: [Object](Object.md)

The skeleton class is a hierarchy of [bones](Bone.md) used for animation. A [model](Model.md) can use a skeleton to warp its vertices for skinned animation. Skeletons can be unique per model, or can be shared across multiple models using the [Model::SetSkeleton](Model_SetSkeleton.md) method.

| Property | Type | Description |
|---|---|---|
| root | shared_ptr<[Bone](Bone.md)\> | top-level bone in the hierarchy |
| [AddHook](Skeleton_AddHook.md) | Method | adds a callback function that gets triggered by the animation |
| [FindBone](Skeleton_FindBone.md) | Method | searches for a bone with the specified name |
