# Window::Restore

This method restores a window that is minimized or maximized to its previous position and size.

## Syntax

- void **Restore**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create user interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();
    auto button = CreateButton("Toggle Window", sz.x / 2 - 50, sz.y / 2 - 15, 100, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWSIZE:
            sz = ui->root->ClientSize();
            button->SetShape(sz.x / 2 - 50, sz.y / 2 - 15, 100, 30);
            break;
        case EVENT_WIDGETACTION:
            if (ev.source == button)
            {
                if (window->Maximized())
                {
                    window->Restore();
                }
                else
                {
                    window->Maximize();
                }
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
