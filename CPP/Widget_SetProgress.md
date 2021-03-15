# Widget::SetProgress #

This method sets the progress complete to display, for a progress bar widget.

## Syntax ##
- void **SetProgress**(const float progress)

| Parameter | Description |
| --- | --- |
| progress | progress complete, in the range from 0 to 1 |

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
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
