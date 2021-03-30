# Window::FlushMouse

This method resets the mouse button states, the mouse wheel position, and the raw mouse movement.

## Syntax

- void **FlushMouse**()

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
    auto sz = ui->root->ClientSize();
    auto label = CreateLabel("Click on the window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_MOUSEDOWN:
            if (ev.source == window)
            {
                //This call to FlushMouse() resets the muose hit state so it will not be detected:
                window->FlushMouse();

                Notify("MouseHit: " + String(window->MouseHit(MOUSE_LEFT)));
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
