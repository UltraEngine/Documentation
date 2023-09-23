# CreateComboBox

The combobox widget displays a drop-down box the user can select an item from. This widget emits a WIDGETSELECT event when a new item is selected.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateComboBox**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateComboBox.png)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto combobox = CreateComboBox((sz.x - 300) / 2, (sz.y - 30) / 2, 300, 30, ui->root);
    for (int n = 0; n < 20; ++n)
    {
        combobox->AddItem("Item " + String(n), n == 0);
    }

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETSELECT:
            Print("Item " + String(ev.data) + " selected");
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
}
```
