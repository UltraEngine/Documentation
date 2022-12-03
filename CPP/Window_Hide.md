# Window::SetHidden

This method hides a window.

## Syntax

- void **SetHidden**(const bool hide)

| Parameter | Description |
|---|---|
| hide | window visibility |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

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
                subwindow->SetHidden(false);
                subwindow->Activate();
            }
            break;

        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            else if (ev.source == subwindow)
            {
                subwindow->SetHidden(true);
            }
            break;
        }
    }

    return 0;
}
```
