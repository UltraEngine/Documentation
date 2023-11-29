# Cos

This function returns the cosine of the specified angle.

## Syntax

- float **Cos**(float angle)
- double **Cos**(double angle)

| Parameter | Description |
| --- | --- |
| angle | angle, in degrees |

## Returns

Returns the cosine of the specified angle.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        float angle = 65;

        Debug.Print("Sin: " + Sin(angle).ToString());
        Debug.Print("Cos: " + Cos(angle).ToString());
        Debug.Print("Tan: " + Tan(angle).ToString());
    }
}
```