# Widget::GetSelectedItem #

For use with listbox and combobox widgets, this method gets the selected widget item.

## Syntax ##

- int **GetSelectedItem**()

## Returns ##
Returns the selected widget item index, or -1 if no item is selected.

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

    auto label = CreateLabel("Selected item: 0",20,20,sz.x,30,ui->root);

    auto listbox = CreateListBox(20, 50, sz.x - 40, sz.y - 70, ui->root);
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
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        case EVENT_WIDGETSELECT:
            label->SetText("Selected item: " + String(listbox->GetSelectedItem()));
            break;
        }
    }
    return 0;
}
```
