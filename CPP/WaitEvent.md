# WaitEvent

This function waits until an event is available in the event queue and returns the oldest event.

## Syntax

[Event](Event.md) **WaitEvent**()

## Returns

Returns the oldest event in the queue.

## Remarks

Use [PeekEvent](PeekEvent.md) to check if any events are available before calling this function, if you don't want the application to pause.

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

    while (true)
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

    return 0;
}
```
