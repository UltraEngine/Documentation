# Skeleton

Base class: [Object](Object.md)

The skeleton class is a hierarchy of [bones](Bone.md) used for animation. A [model](Model.md) can use a skeleton to warp its vertices for skinned animation. Skeletons can be unique per model, or can be shared across multiple models using the [Model::SetSkeleton](Model_SetSkeleton.md) method.

| Property | Type | Description |
|---|---|---|
| root | shared_ptr<[Bone](Bone.md)\> | top-level bone in the hierarchy |
| [Animate](Skeleton_Animate.md) | Method |  |
| [GetBone](Skeleton_GetBone.md) | Method |  |
| [FindBone](Skeleton_FindBone.md) | Method |  |
