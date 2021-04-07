# Widget::SetProgress #

This method sets the progress complete to display, for a progress bar widget.

## Syntax ##
- void **SetProgress**(const double progress)

| Parameter | Description |
| --- | --- |
| progress | progress complete, in the range from 0 to 1 |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

bool UpdateProgress(const Event& e, shared_ptr<Object> extra)
{
    auto widget = extra->As<Widget>();
    widget->SetProgress(Mod(float(e.data) / 20.0f, 1.0f));
    return true;
}

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->GetSize();
    auto widget = CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui->root);
    widget->SetProgress(0.6);

    auto progresstimer = CreateTimer(500);
    ListenEvent(EVENT_TIMERTICK, progresstimer, UpdateProgress, widget);

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
