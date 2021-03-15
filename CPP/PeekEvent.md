# PeekEvent

This function returns true if any events are available in the event queue.

## Syntax

- bool **PeekEvent**()

## Remarks

Most GUI applications will use an event-driven design. Occasionally you may need to perform real-time operations (such as rendering). This method provides a mecahnism to incorporate events into such an application.

## Returns

Returns true of the event queue has any events waiting, otherwise false is returned.

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

    while (true)
    {
        float r = Sin(double(Millisecs()) / 20.0) * 0.5 + 0.5;
        ui->root->SetColor(r, r, r, 1);
        Sleep(1);
        while (PeekEvent())
        {
            const Event ev = WaitEvent();
            switch (ev.id)
            {
            case EVENT_WINDOWCLOSE:
                if (ev.source == window)
                {
                    return 0;
                }
                break;
            }
        }
    }
    return 0;
}
```
