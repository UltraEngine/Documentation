# CreateWindow

This function is used to create a new window.

## Syntax

- shared_ptr<[Window](Window.md)\> **CreateWindow**(const [WString](WString.md)& title, const int x, const int y, const int width, const int height, shared_ptr<[Display](Display.md)\> display, const [WindowStyle](Window.md) style = WINDOW_DEFAULT)

- shared_ptr<[Window](Window.md)\> **CreateWindow**(const [WString](WString.md)& title, const int x, const int y, const int width, const int height, shared_ptr<[Window](Window.md)\> parent, const [WindowStyle](Window.md) style = WINDOW_DEFAULT)

| Parameter | Description |
| ------ | ------ |
| title | text to display in the titlebar |
| x | initial x position of the window |
| y | initial y position of the window |
| width | initial width of the window |
| height | initial height of the window |
| display | Display to create the window on |
| parent | parent Window |
| style | can be any combination of WINDOW_TITLEBAR, WINDOW_RESiZABLE, WINDOW_CENTER, WINDOW_HIDDEN, WINDOW_CHILD, WINDOW_CLIENTCOORDS, and WINDOW_ACCEPTFILES |

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the display
    auto displays = GetDisplays();
    Vec2 displayscale = displays[0]->GetScale();

    //Create a window
    auto style = WINDOW_TITLEBAR | WINDOW_CENTER;
    auto window = CreateWindow("Example", 0, 0, 400 * displayscale.x, 300 * displayscale.y, displays[0], style);

    //Main loop
    while (window->Closed() == false)
    {
        if (window->KeyDown(KEY_ESCAPE)) break;
    }
    return 0;
}
```
