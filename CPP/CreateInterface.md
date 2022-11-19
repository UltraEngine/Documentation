# CreateInterface

This function creates a new graphical user interface for desktop applications or in-game interfaces.

## Syntax

- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[Window](Window.md)\> window)
- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[World](World.md)\> world, shared_ptr<[Font](Font.md)\> font, [iVec2](iVec2.md)\> size)

| Parameter | Description |
| --- | --- |
| window | window to create the user interface on |
| world | world to create the interface in, for 3D graphics |
| font | font to use, for 3D graphics |
| size | interface dimensions, for 3D graphics |

## Returns

Returns a new interface object.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

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
