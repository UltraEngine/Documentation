# MixAngle

This function performs a linear interpolation between two angles and returns the result.

## Syntax

- float **MixAngle**(float angle0, float angle1, float d)
- double **MixAngle**(double angle0, double angle1, double d)

| Parameter | Description |
| --- | --- |
| angle0 | first value |
| angle1 | second value |
| d | interpolation amount |

## Returns

Returns the result of the linear interpolation.

## Remarks

This function only handles rotation on a single axis. For interpolation between full 3D rotations, use the [Quat::Slerp](Quat_Slerp.md) method.

### Example

```csharp
float result = MixAngle(angle0, angle1, d);
double result = MixAngle(angle0, angle1, d);
```