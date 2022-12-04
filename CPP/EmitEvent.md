# EmitEvent

This function adds an event to the event queue and triggers any callbacks added with the [ListenEvent](ListenEvent.md) function.

## Syntax

- void **EmitEvent**(const [Event](Event.md)& event)
- void **EmitEvent**(const EventId id, shared_ptr<[Object](Object.md)\> source, const int data = 0, const int x = 0, const int y = 0, const int width = 0, const int height = 0, shared_ptr<[Object](Object.md)\> extra = NULL, const [WString](WString.md)& text = "")

| Parameter | Description |
| --- | --- |
| event | event to emit |
| id | event ID |
| source | event source |
| data | event data |
| x | X component of event position |
| y | Y component of event position |
| width | X compononent of event size | 
| height | Y component of event size |
| extra | event extra data |
| text | event text data |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();
    auto button = CreateButton("Close window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            if (ev.source == button)
            {
                EmitEvent(EVENT_WINDOWCLOSE, window);
            }
            break;
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
