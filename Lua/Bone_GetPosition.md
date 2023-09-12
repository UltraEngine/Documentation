# Bone:GetPosition

This method returns the position of a bone.

## Syntax

```lua
function Bone:GetPosition(global)
```

## Parameters

| Parameter | Description |
|---|---|
| global | if set to true position is relative to the skeleton, otherwise it is relative to the bone's parent |

## Returns

Returns the bone's position as a [Vec3](Vec3.md) object.