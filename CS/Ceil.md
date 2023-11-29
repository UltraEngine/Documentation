# Ceil

This functions rounds a decimal number up to the upper integer and returns the result.

## Syntax

- **int** [Ceil](#)(**float** f)
- **int64** [Ceil](#)(**double** f)

## Returns

Returns the upper integer value.

## Example

```csharp
using System;

public class Program
{
    public static void Main(string[] args)
    {
        float f = 1.6f;     
        Console.WriteLine(Math.Ceiling(f));
        Console.WriteLine(Math.Floor(f));    
    }
}
```