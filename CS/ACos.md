# ACos

This function returns the arc cosine of the specified value.

## Syntax

- float **ACos**(float value)
- double **ACos**(double value)

| Parameter | Description |
| --- | --- |
| value | cosine value |

## Returns

Returns the arc cosine.

## Example

```csharp
using System;

class Program
{
    static void Main()
    {
        float angle = -65.0f;

        float s = Math.Sin(angle);
        float c = Math.Cos(angle);
        float t = Math.Tan(angle);

        Console.WriteLine("Sin: " + Math.Asin(s).ToString());
        Console.WriteLine("Cos: " + Math.Acos(c).ToString());
        Console.WriteLine("Tan: " + Math.Atan(t).ToString());
    }
}
```