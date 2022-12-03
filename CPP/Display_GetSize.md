# Display::GetSize

This methods retrieves the display size.

## Syntax

- [iVec2](iVec2.md) **GetSize**()

## Returns

Returns the display's size, in screen pixels.

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
