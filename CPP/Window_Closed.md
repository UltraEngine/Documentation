# Window::Closed

This method returns true if the window has been closed since the last call, or since the creation of the window.

## Syntax

- bool **Closed**()

## Returns

Returns the window closed state and resets the state to false.

## Remarks

This method uses a global state to detect when the window has been closed. If two different parts of your application call the method, only one will detect the close event. For finer control use the events system and listen for WINDOWCLOSE events.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    auto sz = ui->root->ClientSize();
    auto button = CreateButton("Close", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui->root);

    while (!window->Closed())
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == button)
            {
                window->Close();
            }
            break;
        }
    }

    return 0;
}
```
