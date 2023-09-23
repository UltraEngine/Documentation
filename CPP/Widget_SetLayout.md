# Widget::SetLayout

This method controls the way a widget behaves when its parent is resized or when the DPI scale setting is changed.

## Syntax

- void **SetLayout**(const int left, const int right, const int top, const int bottom)

| Parameter | Description |
| --- | --- |
| left, right, top, bottom | edge clamp mode, can be 0 or 1 |


## Example 

```c++
//----------------------------------------------------------------------------------------------------------
//
// This example demonstrates widget layout settings. Resize the window to see how each panel adjusts size
//  
//----------------------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);
    window->SetMinSize(640, 480);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widgets
    iVec2 sz = ui->root->ClientSize();

    auto leftpanel = CreatePanel(10, 10, 200, sz.y - 20, ui->root);
    leftpanel->SetLayout(1, 0, 1, 1);
    leftpanel->SetColor(0, 0, 0, 1);
    leftpanel->SetText("Left panel\nLayout: 1, 0, 1, 1");

    auto rightpanel = CreatePanel(sz.x - 10 - 200, 10, 200, sz.y - 20, ui->root);
    rightpanel->SetLayout(0, 1, 1, 1);
    rightpanel->SetColor(0, 0, 0, 1);
    rightpanel->SetText("Right panel\nLayout: 0, 1, 1, 1");

    auto mainpanel = CreatePanel(10 + 200 + 10, 10, sz.x - 10 * 4 - 200 * 2, sz.y - 10 * 3 - 100, ui->root);
    mainpanel->SetLayout(1, 1, 1, 1);
    mainpanel->SetColor(0, 0, 0, 1);
    mainpanel->SetText("Main panel\nLayout: 1, 1, 1, 1");

    auto bottompanel = CreatePanel(10 + 200 + 10, sz.y - 10 - 100, sz.x - 10 * 4 - 200 * 2, 100, ui->root);
    bottompanel->SetLayout(1, 1, 0, 1);
    bottompanel->SetColor(0, 0, 0, 1);
    bottompanel->SetText("Bottom panel\nLayout: 1, 1, 0, 1");

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
