# Degrees

This function converts an angle from radians to degrees.

## Syntax

- float **Radians**(float angle)
- double **Radians**(double angle)

| Parameter | Description |
| --- | --- |
| angle | angle in radians |

## Returns

Returns the angle, converted to degrees.

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
}
```