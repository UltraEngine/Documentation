# Quat::Slerp

This method performs spherical linear interpolation to interpolate between two rotations.

## Syntax

- [Quat](Quat.md) **Slerp**(const [Quat](Quat)& dest, const float blend)

| Parameter | Description |
|---|---|
| dest | target rotation to match |
| blend | interpolation amount between 0 and 1 |

## Returns

Returns the interpolated rotation.
