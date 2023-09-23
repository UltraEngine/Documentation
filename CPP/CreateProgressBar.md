# CreateProgressBar

The progressbar widget displays a horizontal bar that indicates the progress of some task. The progress complete can be set using the [Widget::SetProgress](Widget_SetProgress.md) method.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateProgressBar**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Returns

Returns a new progress bar widget.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateProgressBar.png)

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
