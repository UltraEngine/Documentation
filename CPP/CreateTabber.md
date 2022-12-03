# CreateTabber

The tabber widget is a tabbed panel that allows the user to select different "pages" in a user interface.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateTabber**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateTabber.png)

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

    //Create widget
    auto sz = ui->root->ClientSize();
    auto tabber = CreateTabber(10, 10, sz.x - 20, sz.y - 20, ui->root);
    tabber->AddItem("Item 1", true);
    tabber->AddItem("Item 2");
    tabber->AddItem("Item 3");

    std::array<std::shared_ptr<Widget>, 3> panels;
    sz = tabber->ClientSize();
    panels[0] = CreatePanel(0, 0, sz.x, sz.y, tabber);
    panels[1] = CreatePanel(0, 0, sz.x, sz.y, tabber);
    panels[2] = CreatePanel(0, 0, sz.x, sz.y, tabber);

    //panels[0]->SetColor(0.15, 0.1, 0.1, 1);
    panels[1]->SetColor(0.1, 0.15, 0.1, 1);
    panels[2]->SetColor(0.1, 0.1, 0.15, 1);

    panels[1]->SetHidden(true);
    panels[2]->SetHidden(true);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETSELECT:
            if (ev.source == tabber)
            {
                for (int n = 0; n < tabber->items.size(); ++n)
                {
                    if (n == ev.data)
                    {
                        panels[n]->SetHidden(false);
                    }
                    else
                    {
                        panels[n]->SetHidden(true);
                    }
                }
            }
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
