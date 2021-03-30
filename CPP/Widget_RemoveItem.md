# Widget::RemoveItem

This method removes the item at the specified index.

## Syntax

- void **RemoveItem**(const int item)

| Parameter | Description |
|---|---|
| item | item index to remove, in the range from zero to the number of items minus one |

## Example

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

    //Add items
    for (int n = 0; n < 10; ++n)
    {
        listbox->AddItem("Item " + String(n), n == 0);
    }

    //Remove an item
    listbox->RemoveItem(3);

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
