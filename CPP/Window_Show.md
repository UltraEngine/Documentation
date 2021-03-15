# Window::Show

This method makes a hidden window visible.

## Syntax

- void **Show**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create window
    auto window = CreateWindow("Parent window", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();
    auto button = CreateButton("Show child window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    //Create suvwindow
    auto subwindow = CreateWindow("Child window", 200, 200, 400, 300, window, WINDOW_TITLEBAR | WINDOW_HIDDEN);
    auto subui = CreateInterface(subwindow);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == button)
            {
                subwindow->Show();
            }
            break;

        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            else if (ev.source == subwindow)
            {
                subwindow->Hide();
            }
            break;
        }
    }

    return 0;
}
```
