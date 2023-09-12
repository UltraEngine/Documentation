# Skeleton

Base class: [Object](Object.md)

The skeleton class is a hierarchy of [bones](Bone.md) used for animation. A [model](Model.md) can use a skeleton to warp its vertices for skinned animation. Skeletons can be unique per model, or can be shared across multiple models using the `Model:SetSkeleton` method.

## Properties

| Property | Type | Description |
|---|---|---|
| root | [Bone](Bone.md) | top-level bone in the hierarchy |

## Methods

### `FindBone(name: string): Bone`
Searches for a bone with the specified name.

## Example

```lua
-- Create a new skeleton
local skeleton = Skeleton()

-- Find the bone with the name "head"
local bone = skeleton:FindBone("head")
```