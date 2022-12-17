# Window::GetHandle

This method returns a handle to the system window object.

## Syntax

- HWND **GetHandle**()
- ::Window **GetHandle**()
- NSWindow* **GetHandle**()

## Returns

Returns the system window handle. The return type depends on the platform the program is compiled for.

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

    auto handle = window->GetHandle();

#ifdef _WIN32
    //Modify the window handle with system commands
    auto style = GetWindowLong(handle, GWL_EXSTYLE);
    style |= WS_EX_CONTEXTHELP;
    SetWindowLong(handle, GWL_EXSTYLE, style);
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
