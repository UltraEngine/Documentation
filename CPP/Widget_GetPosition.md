# Widget::GetPosition

This method returns the widget position, relative to the parent or the interface.

## Syntax

- [iVec2](iVec2.md) **GetPosition**(const bool global = false)

| Parameter | Description |
|---|---|
| global | if set to false the position is relative to the parent, otherwise it is relative to the interface |

## Returns

Returns the widget position.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create User Interface
    auto ui = CreateInterface(window);
    auto sz = ui->root->ClientSize();

    //Create widget
    auto panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui->root, PANEL_BORDER);
    panel->SetLayout(0, 1, 0, 1);

    sz = panel->ClientSize();
    auto label = CreateLabel("", 0, 0, sz.x, sz.y, panel, LABEL_CENTER | LABEL_MIDDLE);
    label->SetLayout(1, 1, 1, 1);
    
    auto pos = panel->GetPosition();
    label->SetText("Position: " + String(pos.x) + ", " + String(pos.y));

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        case EVENT_WINDOWSIZE:
            auto pos = panel->GetPosition();
            label->SetText("Position: " + String(pos.x) + ", " + String(pos.y));
            break;
        }
    }
    return 0;
}
```
