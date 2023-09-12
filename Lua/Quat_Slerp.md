# Quat:Slerp

This method performs spherical linear interpolation to interpolate between two rotations.

## Syntax

```lua
function Quat:Slerp(r0, r1, blend)
```

## Parameters

- `r0` (Quat): starting rotation
- `r1` (Quat): end rotation
- `blend` (number): interpolation amount between 0 and 1

## Returns

- Quat: Returns the interpolated rotation.