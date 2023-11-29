# Min

This function returns the minimum of two specified values.

## Syntax

- float **Min**(float value0, float value1)
- double **Min**(double value0, double value1)
- int **Min**(int value0, int value1)

## Returns

Returns the lowest of the two specified values.

## Example

```csharp
using System;
public class MinExample
{
    public static void Main(string[] args)
    {
        float a = 5;
        float b = 3;
    
        Console.WriteLine(Min(a,b));
    }
    
    public static float Min(float value0, float value1)
    {
        return Math.Min(value0, value1);
    }
    
    public static double Min(double value0, double value1)
    {
        return Math.Min(value0, value1);
    }
    
    public static int Min(int value0, int value1)
    {
        return Math.Min(value0, value1);
    }
}
```