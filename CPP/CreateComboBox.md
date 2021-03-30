# CreateComboBox #

The combobox widget displays a drop-down box the user can select an item from. The EDTIABLE style allows the user to input their own values in the textfield. This widget emits a WIDGETSELECT event when a new item is selected.

## Syntax ##
- shared_ptr<[Widget](Widget.md)\> **CreateComboBox**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const ComboBoxStyle = COMBOBOX_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional combobox style, can be COMBOBOX_DEFAULT or COMBOBOX_EDTABLE |

## Example ##
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
    auto combobox = CreateComboBox((sz.x - 300) / 2, (sz.y - 30) / 2, 300, 30, ui->root, COMBOBOX_EDITABLE);
    combobox->AddItem("Item 1", true);
    combobox->AddItem("Item 2");
    combobox->AddItem("Item 3");

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
