# Round

This functions rounds a decimal number off to the nearest integer and returns the result.

## Syntax

- int **Round**(float f)
- long **Round**(double f)

## Returns

Returns the nearest integer value.

## Example

```csharp
using System;
class Program
{
    static void Main()
    {
        Console.WriteLine(Round(1.9f));
    }
	
    static int Round(float f)
    {
        return (int)Math.Round(f);
    }

    static long Round(double f)
    {
        return (long)Math.Round(f);
    }
}
```