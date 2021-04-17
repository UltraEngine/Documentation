# Interface::Save

This method saves the interface to a file or stream.

## Syntax

- bool **Save**(const [WString](WString.md)& path, const SaveFlags flags = SAVE_DEFAULT)
- bool **Save**(shared_ptr<[Stream](Stream.md)\> stream, const SaveFlags flags = SAVE_DEFAULT)

## Returns

Returns true if the interface is successfully saved, otherwise false is returned.

## Example

```c++
#include "UltraEngine.h"

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

    //Save the user interface
    ui->Save(GetPath(PATH_DOCUMENTS) + "/temp.json");

    //Open the file
    RunFile(GetPath(PATH_DOCUMENTS) + "/temp.json");

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
