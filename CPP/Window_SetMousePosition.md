# Window::SetMousePosition

This method moves the mouse pointer to the specified window coordinate.

## Syntax

- void **SetMousePosition**(const int x, const int y)
- void **SetMousePosition**(const [iVec2](iVec2.md)& coords)

| Parameter | Description |
|---|---|
| x | X component of the destination coordinates |
| y | Y component of the destination coordinates |
| coords | destination coordinates |

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
    auto sz = ui->root->ClientSize();
    auto panel = CreatePanel(100, 100, sz.x - 200, sz.y - 200, ui->root);
    panel->SetColor(0, 0, 0, 1);
    panel->SetPointer(POINTER_CROSS);
    auto label = CreateLabel("Click on the black panel to center the mouse",0,43,sz.x,30,ui->root,LABEL_CENTER);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_MOUSEDOWN:
            if (ev.source == panel)
            {
                auto pos = panel->position;
                auto sz = panel->size;
                window->SetMousePosition(pos.x + sz.x / 2, pos.y + sz.y / 2);
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
