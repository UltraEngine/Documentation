# Window::KeyDown

Returns the current key state of the specified key.

## Syntax

- bool **KeyDown**(const KeyCode key)

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key is currently pressed, otherwise false is returned.

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
        if (window->KeyDown(KEY_SPACE))
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
