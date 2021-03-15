# Window::GetPosition

This method returns the position of a window in screen coordinates.

## Syntax

- [iVec2](iVec2.md) **GetPosition**()

## Returns

Returns the window position.

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

    //Display window position
    auto sz = ui->root->ClientSize();
    auto label = CreateLabel("", 0, 0, sz.x, sz.y, ui->root, LABEL_CENTER | LABEL_MIDDLE);
    label->SetLayout(1, 1, 1, 1);

    auto pos = window->GetPosition();
    label->SetText("Window position: " + String(pos.x) + " x " + String(pos.y));

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWMOVE:
            pos = window->GetPosition();
            label->SetText("Window position: " + String(pos.x) + " x " + String(pos.y));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }

    return 0;
}
```
