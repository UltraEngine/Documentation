# Window::Activate

This method makes the window gain the keyboard focus and brings it to the top of the window order.

## Syntax

- void **Activate**()

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);

    auto window2 = CreateWindow("Window 2", 200, 200, 640, 480, displays[0]);

    window1->Activate();

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
