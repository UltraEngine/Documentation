# Window::Minimize

This method minimizes the window to fill the entire dekstop client area.

## Syntax

- void **Minimize**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create windows
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create user interface
    auto ui = CreateInterface(window);

    //Maximize window
    window->Minimize();

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
