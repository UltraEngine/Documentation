# Widget::SetItemText
This method sets a widget item's text and redraws the widget.

## Syntax
- void **SetItemText**(const int item, const WString& text)

| Parameter | Description | 
| --- | --- |
| item | widget item index |
| text | text to set |

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
    listbox->AddItem("Item 1", true);
    listbox->AddItem("Item 2");
    listbox->AddItem("Item 3");
    listbox->AddItem("Item 4");
    listbox->AddItem("Item 5");
    listbox->AddItem("Item 6");

    //Modify the item text
    listbox->SetItemText(0, "This is the first item");

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
