# CreateProgressBar #

The progressbar widget displays a horizontal bar that indicates the progress of some task. The progress complete can be set using the [Widget::SetProgress](SetProgress.md) method.

## Syntax ##
- shared_ptr<[Widget](Widget.md)\> **CreateProgressBar**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example ##

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load plugins
    auto plugin_svg = LoadPlugin("Plugins/SVG.*");

    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->GetSize();
    auto widget = CreateProgressBar(20, (sz.y - 30)/2, sz.x - 40, 30, ui->root);
    widget->SetProgress(0.6);

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
