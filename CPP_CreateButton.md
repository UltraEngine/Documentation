# CreateButton #

This function creates a button widget.

## Syntax ##
- shared_ptr<Widget\> **CreateButton**(const WString& text, const int x, const int y, const int width, const int height, shared_ptr<Widget\> parent, ButtonStyle = BUTTON_DEFAULT)
- shared_ptr<Widget\> **CreateButton**(const WString& text, const int x, const int y, const int width, const int height, shared_ptr<Interface\> interface, ButtonStyle = BUTTON_DEFAULT)

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 640, 480, displays[0], WINDOW_TITLEBAR|WINDOW_CENTER);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Main panel
    auto sz = window->ClientSize();
    auto panel = CreatePanel(0, 0, sz.x, sz.y, ui);

    //Create buttons
    int y = 20;
    int sep = 40;
    
    auto button = CreateButton("Button", 20, y, 120, 30, panel);
    y += sep;
    
    auto toggle = CreateButton("Toggle", 20, y, 120, 30, panel, BUTTON_TOGGLE);
    y += sep;
    
    auto toolbar = CreateButton("Toolbar", 20, y, 120, 30, panel, BUTTON_TOOLBAR);
    y += sep;

    auto checkbox = CreateButton("Checkbox", 20, y, 120, 30, panel, BUTTON_CHECKBOX);
    y += sep;
    
    auto radio1 = CreateButton("Option 1", 20, y, 120, 30, panel, BUTTON_RADIO);
    radio1->SetState(WIDGETSTATE_SELECTED);
    
    y += sep;
    auto radio2 = CreateButton("Option 2", 20, y, 120, 30, panel, BUTTON_RADIO);

    while (window->Closed() == false)
    {
        WaitEvent();
    }
    return 0;
}
```
