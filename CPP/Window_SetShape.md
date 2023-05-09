# Window::SetShape

This method sets the window's position and size.

## Syntax

- void **SetShape**(const int x, const int y, const int width, const int height)
- void **SetShape**(const [iVec2](iVec2.md)& position, const [iVec2](iVec2.md)& size)

| Parameter | Description |
| --- | --- |
| position, (x, y) | new window screen position |
| size, (width, height) | new window size |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Adjust window position
    auto dsz = displays[0]->GetSize();
    auto wsz = window->GetSize();
    window->SetShape((dsz.x - wsz.x) / 2, (dsz.y - wsz.y) / 2, wsz.x, wsz.y);

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
