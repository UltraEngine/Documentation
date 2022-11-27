# GetDisplays

This function retrievs a list of hardware monitors that are currently in use.

## Syntax 

- vector<shared_ptr<[Display](Display.md)\> \> **GetDisplays**()

## Returns

Returns an array of all displays currently in use, with the primary display in the first index.

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
        for (int n = 0; n < gfxmodes.size(); ++n)
        {
            Print("     " + WString(n) + ": " + WString(gfxmodes[n]));
        }
    }
    return 0;
}
```
