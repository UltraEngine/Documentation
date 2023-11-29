# Green

Extracts the green component from a packed [RGBA](Rgba.md) value.

## Syntax

- byte **Green**(uint rgba)

## Returns

Returns the green component of the color.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        uint color = Rgba(220,64,128,255);

        Console.WriteLine(Red(color));
        Console.WriteLine(Green(color));
        Console.WriteLine(Blue(color));
        Console.WriteLine(Alpha(color));
    }
}
```