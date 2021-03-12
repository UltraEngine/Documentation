# CreatePanel #
This function creates a Panel widget. The Panel widget is a rectangular area for framing child widgets.

## Syntax ##
- shared_ptr<shared_ptr<Widget\> \> **CreatePanel**(const int x, const int y, const int width, const int height, shared_ptr<Widget\> parent, const PanelStyle style = PANEL_DEFAULT)

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
    auto sz = ui->root->ClientSize();

    //Create widget
    auto panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui->root);
    panel->SetColor(0, 0, 0, 1);

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
