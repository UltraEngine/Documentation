# GetDisplays

This function retrieves a list of hardware monitors that are currently in use.

## Syntax 

- List<Display> GetDisplays()

## Returns

Returns a list of all displays currently in use, with the primary display in the first index.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        List<Display> displays = GetDisplays();

        for (int k = 0; k < displays.Count; ++k)
        {
            Print("Display " + k.ToString() + ":");
            Print(" Position: " + displays[k].GetPosition().ToString());
            Print(" Size: " + displays[k].GetSize().ToString());
            Print(" Scale: " + displays[k].GetScale().ToString());
            Print(" Graphics Modes:");
            List<GraphicsMode> gfxmodes = displays[k].graphicsmodes;
            for (int n = 0; n < gfxmodes.Count; ++n)
            {
                Print("     " + n.ToString() + ": " + gfxmodes[n].ToString());
            }
        }
    }
}
```
