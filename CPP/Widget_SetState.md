# Widget::SetState

This method sets the widget state. The widget state may be WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE.

## Syntax

- void **SetState**(const WidgetState state)
- void **SetState**(const bool selected)

| Parameter | Description |
|---|---|
| state | widget state to set, either WIDGETSTATE_SELECTED, WIDGETSTATE_UNSELECTED, or WIDGETSTATE_INDETERMINATE |
| selected | if true the state will be WIDGETSTATE_SELECTED, otherwise it will be WIDGETSTATE_UNSELECTED |

## Example

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
    auto sz = ui->root->ClientSize();
    auto button = CreateButton("Checkbox", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui->root, BUTTON_CHECKBOX);

    //Set the widget state
    button->SetState(WIDGETSTATE_INDETERMINATE);

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
