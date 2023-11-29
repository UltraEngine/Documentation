# ASin

This function returns the arc sine of the specified value.

## Syntax

- `float **ASin**(float value)`
- `double **ASin**(double value)`

| Parameter | Description |
| --- | --- |
| value | sine value |

## Returns

Returns the arc sine.

## Example

```csharp
using System;
namespace GameEngineExample
{
    class Program
    {
        static void Main(string[] args)
        {
            float angle = -65.0f;

            float s = Math.Sin(angle * Math.PI / 180);
            float c = Math.Cos(angle * Math.PI / 180);
            float t = Math.Tan(angle * Math.PI / 180);

            Console.WriteLine("Sin: " + Math.Asin(s));
            Console.WriteLine("Cos: " + Math.Acos(c));
            Console.WriteLine("Tan: " + Math.Atan(t));
        }
    }
}
```