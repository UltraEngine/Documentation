# Radians

This function converts an angle from degrees to radians.

## Syntax

- float **Radians**(float angle)
- double **Radians**(double angle)

| Parameter | Description |
| --- | --- |
| angle | angle in degrees |

## Returns

Returns the angle, converted to radians.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        float a = 45;
        float r = Radians(a);
        Console.WriteLine(r);
        Console.WriteLine(Degrees(r));
    }

    static float Radians(float angle)
    {
        float radians = (float)(Math.PI / 180) * angle;
        return radians;
    }

    static float Degrees(float angle)
    {
        float degrees = (float)(180 / Math.PI) * angle;
        return degrees;
    }
}
```