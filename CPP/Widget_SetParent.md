# Widget::SetParent

This method makes this widget a child of the specified parent widget.

## Syntax

- void **SetParent**(shared_ptr<[Widget](Widget.md)\> parent)
- void **SetParent**(shared_ptr<[Widget](Widget.md)\> parent, const int position)

| Parameter | Description |
| --- | --- |
| parent | new parent widget |
| position | the position in the parent child list to insert this widget |

## Remarks
If the position is not specified the widget will be added to the end of the parent's list of children.

The parent widget may be NULL if you are deleting the widget.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create User Interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();

    //Panel
    auto panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui->root);
    panel->SetColor(0, 0, 0);
    panel->SetLayout(1, 1, 1, 1);

    //Subpanel
    sz = panel->ClientSize();
    auto subpanel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui->root);
    subpanel->SetColor(0.5, 0.5, 0.5);
    subpanel->SetLayout(1, 1, 1, 1);
    
    //Parent the subpanel to the panel
    subpanel->SetParent(panel);

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
