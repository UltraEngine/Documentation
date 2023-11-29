# Skeleton

Base class: [Object](Object.md)

The skeleton class is a hierarchy of [bones](Bone.md) used for animation. A [model](Model.md) can use a skeleton to warp its vertices for skinned animation. Skeletons can be unique per model, or can be shared across multiple models using the [Model.SetSkeleton](Model_SetSkeleton.md) method.

| Property | Type | Description |
|---|---|---|
| root | `Bone` | top-level bone in the hierarchy |
| [FindBone](Skeleton_FindBone.md) | Method | searches for a bone with the specified name |

## Example

### C#

```csharp
// Create an instance of the Skeleton class
Skeleton skeleton = new Skeleton();

// Set the top-level bone in the hierarchy
Bone root = new Bone();
skeleton.root = root;

// Find a bone with the specified name
Bone bone = skeleton.FindBone("boneName");
```
