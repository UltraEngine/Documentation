# CreateTimer #
This function creates a new timer object. A timer emits a TIMERTICK event at a regular frequency. The event source will be the timer object, and the event data value will be the timer tick count.

## Syntax ##
- shared_ptr<[Timer](Timer.md)\> **CreateTimer**(const int frequency)

### Parameters ###
| Name | Description |
| --- | --- |
| frequency | timer frequency in milliseconds |

## Returns ##
Returns a new timer object.

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();

    auto label = CreateLabel("", 0, 0, sz.x, sz.y, ui->root, LABEL_CENTER | LABEL_MIDDLE);
    label->SetFontScale(4);

    //Create timer
    auto timer = CreateTimer(1000);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_TIMERTICK:
            label->SetText(ev.data);
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
