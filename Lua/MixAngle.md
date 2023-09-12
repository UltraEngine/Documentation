# MixAngle

This function performs a linear interpolation between two angles and returns the result.

## Syntax

```lua
MixAngle(angle0: number, angle1: number, d: number): number
```

## Parameters

- `angle0`: The first value.
- `angle1`: The second value.
- `d`: The interpolation amount.

## Returns

Returns the result of the linear interpolation.

## Remarks

This function only handles rotation on a single axis. For interpolation between full 3D rotations, use the [Quat::Slerp](Quat_Slerp.md) method.