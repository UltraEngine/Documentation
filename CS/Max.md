# Max

This function returns the maximum of two specified values.

## Syntax

- float **Max**(float value0, float value1)
- double **Max**(double value0, double value1)
- int **Max**(int value0, int value1)

## Returns

Returns the highest of the two specified values.

## Example

```csharp
using System;
                    
public class Program
{
    public static void Main()
    {
        float a = 5;
        float b = 3;
        
        Console.WriteLine(Max(a, b));
    }
    
    private static float Max(float value0, float value1)
    {
        return Math.Max(value0, value1);
    }
    
    private static double Max(double value0, double value1)
    {
        return Math.Max(value0, value1);
    }
    
    private static int Max(int value0, int value1)
    {
        return Math.Max(value0, value1);
    }
}
```