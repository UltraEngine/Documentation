# Clamp

This function constrains a value between a lower and upper limit.

## Syntax

- float **Clamp**(float value, float minimum, float maximum)
- double **Clamp**(double value, double minimum, double maximum)
- int **Clamp**(int value, int minimum, int maximum)

| Parameter | Description |
| --- | --- |
| value | value to constrain |
| minimum | lower limit of the return value |
| maximum | upper limit of the return value |

## Returns

The closest value to the input value that is between the specified minimum and maximum will be returned.

## Example

```csharp
using System;

namespace Example
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(Clamp(307, 0, 255));
        }

        static int Clamp(int value, int minimum, int maximum)
        {
            if (value < minimum)
                return minimum;
            else if (value > maximum)
                return maximum;
            else
                return value;
        }
    }
}
```