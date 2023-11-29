# Display.GetSize

This method retrieves the display size.

## Syntax

- [iVec2](iVec2.md) **GetSize**()

## Returns

Returns the display's size, in screen pixels.

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        var displays = Display.GetDisplays();
        
        for (int k = 0; k < displays.Count; ++k)
        {
            Console.WriteLine("Display " + k + ":");
            Console.WriteLine(" Position: " + displays[k].GetPosition());
            Console.WriteLine(" Size: " + displays[k].GetSize());
            Console.WriteLine(" Scale: " + displays[k].GetScale());
            Console.WriteLine(" Graphics Modes:");
            
            var gfxmodes = displays[k].graphicsmodes;
            for (int n = 0; n < gfxmodes.Count; ++n)
            {
                Console.WriteLine("     " + n + ": " + gfxmodes[n]);
            }
        }   
    }
}
```