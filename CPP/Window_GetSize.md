# Window::GetSize

This method returns the dimensions of a window. To retrieve the area inside the window excluding the titlebar and borders, use the [ClientSize](Window_ClientSize.md) method.

## Syntax

- [iVec2](iVec2.md) **ClientSize**()

## Returns

Returns the window size.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    //Create user interface
    auto ui = CreateInterface(window);

    //Display window size
    auto sz = ui->root->ClientSize();
    auto label = CreateLabel("", 0, 0, sz.x, sz.y, ui->root, LABEL_CENTER | LABEL_MIDDLE);
    label->SetLayout(1, 1, 1, 1);

    sz = window->GetSize();
    auto csz = window->ClientSize();
    label->SetText("Window size: " + String(sz.x) + " x " + String(sz.y) + "\n\nClient size: " + String(csz.x) + " x " + String(csz.y));

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWSIZE:
            sz = window->GetSize();
            csz = window->ClientSize();
            label->SetText("Window size: " + String(sz.x) + " x " + String(sz.y) + "\n\nClient size: " + String(csz.x) + " x " + String(csz.y));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }

    return 0;
}
```
