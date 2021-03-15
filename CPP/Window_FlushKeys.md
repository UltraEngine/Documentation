# Window::FlushKeys

This method resets the key button states.

## Syntax

- void **FlushKeys**()

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
    auto sz = ui->root->ClientSize();
    auto label = CreateLabel("Press space key", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_KEYDOWN:
            if (ev.source == window and ev.data == KEY_SPACE)
            {
                //This call to FlushKeys() resets the key hit state so it will not be detected:
                window->FlushKeys();

                Notify("KeyHit: " + String(window->KeyHit(KEY_SPACE)));
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
