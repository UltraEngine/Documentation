# Display.GetPosition #

This method retrieves the display position on the virtual display.

## Syntax ##
- [Vector2](iVec2.md) **GetPosition**()

## Returns ##
Returns the display's position on the bounding virtual display.

## Example ##
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        var displays = Display.GetDisplays();
        for (int k = 0; k < displays.Count; ++k)
        {
            Console.WriteLine("Display " + k + ":");
            Console.WriteLine("    Position: " + displays[k].GetPosition());
            Console.WriteLine("    Size: " + displays[k].GetSize());
            Console.WriteLine("    Scale: " + displays[k].GetScale());
            Console.WriteLine("    Graphics Modes:");
            var gfxmodes = displays[k].GraphicsModes();
            for (int n = 0; n < gfxmodes.Count; ++n)
            {
                Console.WriteLine("        " + n + ": " + gfxmodes[n]);
            }
        }
    }
}
```
