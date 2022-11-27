# Window::MouseDown

Returns the current press state of the specified mouse button.

## Syntax

- bool **MouseDown**(const MouseButton button)

| Parameter | Description |
|---|---|
| button | mouse button to test, can be MOUSE_LEFT, MOUSE_RIGHT, or MOUSE_MIDDLE |

## Returns

Returns true if the specified mouse button is currently pressed, otherwise false is returned.

## Example

```c++
//-------------------------------------------------------------------------------------------------
//
// This example uses the left mouse button to control the color of a panel widget.
//
//-------------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create windows
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    while (true)
    {
        if (window->MouseDown(MOUSE_LEFT))
        {
            ui->root->SetColor(1, 0, 0, 1);
        }
        else
        {
            ui->root->SetColor(0, 0, 0, 1);
        }

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
