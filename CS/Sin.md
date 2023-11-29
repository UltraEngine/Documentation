# Sin

This function returns the sine of the specified angle.

## Syntax

- float **Mathf.Sin**(float angle)
- double **Mathf.Sin**(double angle)

| Parameter | Description |
| --- | --- |
| angle | angle, in degrees |

## Returns

Returns the sine of the specified angle.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        float angle = 65;

        Console.WriteLine("Sin: " + Math.Sin(angle));
        Console.WriteLine("Cos: " + Math.Cos(angle));
        Console.WriteLine("Tan: " + Math.Tan(angle));
    }
}
```