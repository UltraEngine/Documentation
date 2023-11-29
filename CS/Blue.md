# Blue

Extracts the blue component from a packed [RGBA](Rgba.md) value.

## Syntax

- byte **Blue**(uint rgba)

## Returns

Returns the blue component of the color.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        uint color = Rgba(220, 64, 128, 255);

        Console.WriteLine(Red(color));
        Console.WriteLine(Green(color));
        Console.WriteLine(Blue(color));
        Console.WriteLine(Alpha(color));
    }
}
```