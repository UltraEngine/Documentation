# Widget::SelectItem #

For use with listbox and combobox widgets, this method selects a widget item.

## Syntax ##

- void **SelectItem**(const int index)

| Parameter | Description |
|-|-|
| index | widget item index, in the range from zero to the number of items minus one, or -1 to deselect all items |

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
    auto listbox = CreateListBox(20, 20, sz.x - 40, sz.y - 40, ui->root);

    //Add items
    for (int n = 0; n < 10; ++n)
    {
        listbox->AddItem("Item " + String(n));
    }

    //Select an item
    listbox->SelectItem(3);

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
