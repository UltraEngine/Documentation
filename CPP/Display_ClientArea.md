# Display::ClientArea

This method returns the usable area within a screen, excluding system task bars or other decorations.

## Syntax

[iVec4](iVec4.md) **ClientArea**()

## Returns

Returns the usable area of the screen.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    iVec4 area = displays[0]->ClientArea();

    //Create a window
    auto window = CreateWindow("Ultra Engine", area.x, area.y, area.width, area.height, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create User Interface
    auto ui = CreateInterface(window);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
