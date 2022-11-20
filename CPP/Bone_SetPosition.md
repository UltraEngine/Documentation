# Bone::SetPosition

This method can be used to manually rotate a bone. You can control skinned models enirely in code or apply your own movements on top of animation.

## Syntax

- void **SetPosition**(const float x, const float y, const float z, const bool global = false)
- void **SetPosition**(const [Vec3](Vec3.md)& position, const bool global = false)

| Parameter | Description |
|---|---|
| position, (pitch, yaw, roll) | position to set |
| global | if set to true position is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World::Update](World_Update.md) and before [World::Render](World_Render.md).
