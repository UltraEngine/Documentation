# Quat::Slerp

This method performs spherical linear interpolation to interpolate between two rotations.

## Syntax

- [Quat](Quat.md) **Slerp**(const [Quat](Quat)& r0, const [Quat](Quat)& r1, const float blend)

| Parameter | Description |
|---|---|
| r0 | starting rotation |
| r1 | end rotation |
| blend | interpolation amount between 0 and 1 |

## Returns

Returns the interpolated rotation.
