# CreateTextField #

The textfield widget is an editable input box. It will emit a WIDGETACTION event if the text changes and the widget loses the focus or the enter key is pressed. If the DYNAMIC style is used, a WIDGETACTION event will be emitted whenever the widget text changes. The INTEGER and NUMBER styles allow for numeric-only input. The FILEPATH style allows only valid system file paths. If the READONLY style is used the widget text will not be editable.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateTextField**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TextField style = TEXTFIELD_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be TEXTFIELD_DEFAULT, TEXTFIELD_READONLY, TEXTFIELD_DYNAMIC, TEXTFIELD_PASSWORD, TEXTFIELD_NUMBER, TEXTFIELD_INTEGER, or TEXTFIELD_FILEPATH |

## Example ##
```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load plugins
    auto plugin_svg = LoadPlugin("Plugins/SVG.*");

    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create User Interface
    auto ui = CreateInterface(window);

    //Create widget
    auto sz = ui->root->ClientSize();
    auto textfield = CreateTextField(20, 20, 300, 32, ui->root);
    textfield->SetText("Here is some text!");  

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
