# Floor

This functions rounds a decimal number down to the lower integer and returns the result.

## Syntax

- `int` [**Floor**](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/inside-a-program/methods#declaring-methods)(`float` f)
- `long` [**Floor**](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/inside-a-program/methods#declaring-methods)(`double` f)

## Returns

Returns the lower integer value.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        float f = 1.6f;
        Console.WriteLine(Math.Ceiling(f));
        Console.WriteLine(Math.Floor(f));
    }
}
```