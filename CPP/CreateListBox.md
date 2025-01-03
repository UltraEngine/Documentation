# CreateListBox

The listbox widget displays a vertical list of items. The widget emits a WIDGETACTION event when an item is double-clicked, or when the enter key is pressed, with the item index stored in the event data member. The widget emits a WIDGETSELECT event when a new item is selected, with the item index stored in the event data member.

## Syntax
- shared_ptr<[Widget](Widget.md)\> **CreateListBox**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateListBox.png)

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
    auto sz = ui->root->GetSize();
    auto listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui->root);
    listbox->AddItem("Item 1", true);
    listbox->AddItem("Item 2");
    listbox->AddItem("Item 3");
    listbox->AddItem("Item 4");
    listbox->AddItem("Item 5");
    listbox->AddItem("Item 6");

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WIDGETACTION:
            Print("Item " + String(ev.data) + " action");
            break;
        case EVENT_WIDGETSELECT:
            Print("Item " + String(ev.data) +" selected");
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }
    return 0;
}
```
