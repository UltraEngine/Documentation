# Alpha

Extracts the alpha component from a packed [RGBA](Rgba.md) value.

## Syntax

- byte **Alpha**(uint rgba)

## Returns

Returns the alpha component of the color.

## Example

```csharp
using System;

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