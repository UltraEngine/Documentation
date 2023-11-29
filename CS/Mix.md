# Mix

This function performs a linear interpolation and returns the result.

## Syntax

- float **Mix**(float value0, float value1, float d)
- double **Mix**(double value0, double value1, double d)

| Parameter | Description |
| --- | --- |
| value0 | first value |
| value1 | second value |
| d | interpolation amount |

## Returns

Returns the result of the linear interpolation.

## Example
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(Mix(10.0f, 20.0f, 0.75f));
    }
    
    static float Mix(float value0, float value1, float d)
    {
        return value0 + d * (value1 - value0);
    }
}
```