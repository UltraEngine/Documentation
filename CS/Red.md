# Red
Extracts the red component from a packed [RGBA](Rgba.md) value.

## Syntax

- byte **Red**(uint rgba)

## Returns

Returns the red component of the color.

## Example

```csharp
using UltraEngine;
using System;

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