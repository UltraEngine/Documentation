# Window::GetHandle

This method returns a handle to the system window object.

## Syntax

- HWND **GetHandle**()

## Returns

Returns the system window handle.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR);

    //Modify the window handle with system commands
#ifdef _WIN32
    HWND hwnd = window->GetHandle();
    auto style = GetWindowLong(hwnd, GWL_EXSTYLE);
    style |= WS_EX_CONTEXTHELP;
    SetWindowLong(hwnd, GWL_EXSTYLE, style);
#endif

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
