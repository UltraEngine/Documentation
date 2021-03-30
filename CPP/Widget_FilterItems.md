# Widget::FilterItems #

This method filters a widget's items with a search term. All items that do not contain the search term will be hidden.

## Syntax ##
- void **FilterItems**(const [WString](WString.md)& filter)

| Parameter | Description |
| --- | --- |
| filter | search text to match, or an empty string to remove the filter |

## Example ##
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
    auto sz = ui->root->GetSize();

    //Create filter input
    auto textfield = CreateTextField(20, 20, sz.x - 40, 30, ui->root, TEXTFIELD_DYNAMIC);
    textfield->Activate();

    //Create list box
    auto listbox = CreateListBox(20, 55, sz.x - 40, sz.y - 75, ui->root);
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
            if (ev.source == textfield)
            {
                listbox->FilterItems(textfield->text);
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
