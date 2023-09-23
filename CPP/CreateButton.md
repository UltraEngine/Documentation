# CreateButton

The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected.

## Syntax

- shared_ptr<[Widget](Widget.md)\> **CreateButton**(const [WString](WString.md)& text, const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const ButtonStyle = BUTTON_DEFAULT)

| Parameter | Description |
| --- | --- |
| text | widget text |
| x | widget x position |
| y | widget y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | optional button style, can be any combination of BUTTON_CANCEL, BUTTON_CHECKBOX, BUTTON_RADIO, BUTTON_OK, BUTTON_TOGGLE, and BUTTON_TOOLBAR. |

## Returns

Returns a new button object.

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/CreateButton.png)

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create buttons
    int x = (window->ClientSize().x - 120) / 2;
    int y = 50;
    int sep = 40;

    auto button = CreateButton("Button", x, y, 120, 30, ui->root);
    y += sep;

    auto toggle = CreateButton("Toggle", x, y, 120, 30, ui->root, BUTTON_TOGGLE);
    y += sep;

    auto toolbar = CreateButton("Toolbar", x, y, 120, 30, ui->root, BUTTON_TOOLBAR);
    y += sep;

    auto checkbox = CreateButton("Checkbox", x, y, 120, 30, ui->root, BUTTON_CHECKBOX);
    y += sep;

    auto radio1 = CreateButton("Option 1", x, y, 120, 30, ui->root, BUTTON_RADIO);
    radio1->SetState(WIDGETSTATE_SELECTED);

    y += sep;
    auto radio2 = CreateButton("Option 2", x, y, 120, 30, ui->root, BUTTON_RADIO);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
            case EVENT_WIDGETACTION:
                Print(ev.source->As<Widget>()->text);
                break;
            case EVENT_WINDOWCLOSE:
                return 0;
                break;
        }
    }
    return 0;
}
```
