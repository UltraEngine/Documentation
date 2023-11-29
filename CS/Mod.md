# Mod

This function performs a modulus operation and returns the result.

## Syntax

- float **Mod**(float value, float divisor)
- double **Mod**(double value, double divisor)

| Parameter | Description |
| --- | --- |
| value | value to determine the modulus for |
| divisor | value to divide by |

## Returns

Returns the result of the modulus operation.

## Example

```csharp
using System;

public class Program
{
    public static void Main(string[] args)
    {
        float a = 735;
        a = Mod(a, 360);
        Console.WriteLine(a);
    }
    
    public static float Mod(float value, float divisor)
    {
        return value % divisor;
    }
}
```