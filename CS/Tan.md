# Tan #

This function returns the tangent of the specified angle.

## Syntax ##

- float **Tan**(float angle)
- double **Tan**(double angle)

| Parameter | Description |
| --- | --- |
| angle | angle, in degrees |

## Returns ##

Returns the tangent of the specified angle.

Example:

```csharp
float angleInDegrees = 45.0f;
float tangent = MathF.Tan(MathF.PI / 180.0f * angleInDegrees);
Console.WriteLine("Tangent of {0} degrees: {1}", angleInDegrees, tangent);

double angleInDegrees = 60.0;
double tangent = Math.Tan(Math.PI / 180.0 * angleInDegrees);
Console.WriteLine("Tangent of {0} degrees: {1}", angleInDegrees, tangent);
```