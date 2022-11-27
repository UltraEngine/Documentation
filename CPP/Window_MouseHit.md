# Window::MouseHit

Returns true if the specified mouse button has been pressed since the last call to the method, or since the creation of the window.

## Syntax

- bool **MouseHit**(const MouseButton button)

| Parameter | Description |
|---|---|
| button | mouse button to test, can be MOUSE_LEFT, MOUSE_RIGHT, or MOUSE_MIDDLE |

## Returns

Returns true if the specified mouse button has been pressed, otherwise false is returned.

## Remarks

This method uses a global state to track whether any MOUSEDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the button was pressed. The event system should be used for finer control over mouse input.

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
        if (window->MouseHit(MOUSE_LEFT))
        {
            ui->root->SetColor(Random(1.0f), Random(1.0f), Random(1.0f), 1);
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
