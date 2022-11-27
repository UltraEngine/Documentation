# Window::KeyHit

Returns true if the specified key has been pressed since the last call to KeyHit, or since the creation of the window.

## Syntax

- bool **KeyHit**(const KeyCode key)

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key has been pressed, otherwise false is returned.

## Remarks

This method uses a global state to track whether any KEYDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the key was pressed. The event system should be used for finer control over keyboard input.

## Example

```c++
//-------------------------------------------------------------------------------------------------
//
// This example uses the space key to control the color of a panel widget.
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
        if (window->KeyHit(KEY_SPACE))
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
