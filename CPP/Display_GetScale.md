# Display::GetScale

This methods retrieves the display scaling factor that is currently in use on this display.

## Syntax

- float GetScale()

## Returns

Returns the scaling factor of this display.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    auto displays = GetDisplays();

    for (int k=0; k < displays.size(); ++k)
    {
        Print("Display " + WString(k) + ":");
        Print(" Position: " + WString(displays[k]->GetPosition()));
        Print(" Size: " + WString(displays[k]->GetSize()));
        Print(" Scale: " + WString(displays[k]->GetScale()));
        Print(" Graphics Modes:");
        auto gfxmodes = displays[k]->graphicsmodes;
        for (int n=0; n < gfxmodes.size(); ++n)
        {
            Print("     " + WString(n) + ": " + WString(gfxmodes[n]));
        }
    }
    return 0;
}
```
