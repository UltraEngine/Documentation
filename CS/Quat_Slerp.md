# Quat.Slerp

This method performs spherical linear interpolation to interpolate between two rotations.

## Syntax

- [Quat](Quat.md) **Slerp**(Quat dest, float blend)

| Parameter | Description |
|---|---|
| dest | target rotation to match |
| blend | interpolation amount between 0 and 1 |

## Returns

Returns the interpolated rotation.

## Example

```csharp
Quat startRotation = new Quat(0, 0, 0, 1);
Quat endRotation = new Quat(1, 1, 1, 1);
float interpolationAmount = 0.5f;

Quat interpolatedRotation = Quat.Slerp(startRotation, endRotation, interpolationAmount);
```