# Window::HideMouse

This method hides the mouse pointer when it is inside the window area.

## Syntax

- void **HideMouse**()

## Example

```c++
//-------------------------------------------------------------------------------------------------
//
// This example hides the mouse cursor and uses the escape key to show it.
//
//-------------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create windows
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Hide mouse cursor
    window->HideMouse();

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_KEYDOWN:
            if (ev.data == KEY_ESCAPE) window->ShowMouse();
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }

    return 0;
}
```
