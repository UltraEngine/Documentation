# Rgba

This function combines four 8-bit color channels into a single packed RGBA color.

## Syntax

```csharp
uint **Rgba**(byte r, byte g, byte b, byte a = 255)
```

| Parameter | Description |
| --- | --- |
| r | red component |
| g | green component |
| b | blue component |
| a | alpha component |

## Returns

Returns an RGBA color packed into a single integer. The individual color channel values can be extracted with the [Red](Red), [Green](Green.md), [Blue](Blue.md), and [Alpha](Alpha.md) functions.

## Example

```csharp
using System;
                    
public class Program
{
    public static void Main()
    {
        uint color = Rgba(220, 64, 128, 255);

        Console.WriteLine(Red(color));
        Console.WriteLine(Green(color));
        Console.WriteLine(Blue(color));
        Console.WriteLine(Alpha(color));
    }
}
```
