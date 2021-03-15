# ActiveWindow

This functions returns the focused application window, or NULL if no application window has the focus.

## Syntax

shared_ptr<[Window](Window.md)\> **ActiveWindow**()

## Returns

Returns the focused window.

# Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create windows
    auto window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);
    auto window2 = CreateWindow("Window 2 (Active)", 200, 200, 640, 480, displays[0]);

    shared_ptr<Window> active;

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWSELECT:
            active = ActiveWindow();
            if (active == window1)
            {
                window1->SetText("Window 1 (Active)");
                window2->SetText("Window 2");
            }
            else if (active == window2)
            {
                window1->SetText("Window 1");
                window2->SetText("Window 2 (Active)");
            }
            else
            {
                window1->SetText("Window 1");
                window2->SetText("Window 2");
            }
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }

    return 0;
}
```
