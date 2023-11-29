# Display.GetScale

This method retrieves the display scaling factor that is currently in use on this display.

## Syntax

- **float GetScale**()

## Returns

Returns the scaling factor of this display.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        var displays = Display.GetDisplays();

        for (int k = 0; k < displays.Count; ++k)
        {
            Print("Display " + k + ":");
            Print(" Position: " + displays[k].GetPosition());
            Print(" Size: " + displays[k].GetSize());
            Print(" Scale: " + displays[k].GetScale());
            Print(" Graphics Modes:");
            var gfxmodes = displays[k].graphicsmodes;
            for (int n = 0; n < gfxmodes.Count; ++n)
            {
                Print("     " + n + ": " + gfxmodes[n]);
            }
        }
    }
}
```