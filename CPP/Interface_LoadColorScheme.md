# Interface::LoadColorScheme

This method loads a color scheme from a JSON file.

## Syntax

- bool **LoadColorScheme**(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns

Returns true if the color scheme was successfully loaded, otherwise false is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    //Load color scheme
    ui->LoadColorScheme("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Themes/light.json");

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            break;
        }
    }
    return 0;
}
```
