# CreateWindow #
This function is used to create a new window.

## Syntax ##
- shared_ptr<[Window](CPP_Window)\> **CreateWindow**(const WString& title, const int x, const int y, const int width, const int height, shared_ptr<[Display](Display.md)\> display, const [WindowStyle](CPP_Window) style = WINDOW_DEFAULT)
- shared_ptr<[Window](CPP_Window)\> **CreateWindow**(const WString& title, const int x, const int y, const int width, const int height, shared_ptr<[Window](Window.md)\> display, const [WindowStyle](CPP_Window) style = WINDOW_DEFAULT)

### Parameters ###
| Name | Description |
| ------ | ------ |
| display |  |
| title |  |
| x | |
| y |  |
| width | |
| height | |
| style |  |
| parent |  |

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the display
    auto displays = ListDisplays();
    Vec2 displayscale = displays[0]->GetScale();

    //Create a window
    auto style = WINDOW_TITLEBAR | WINDOW_CENTER;
    auto window = CreateWindow(displays[0], "Example", 0, 0, 400 * displayscale.x, 300 * displayscale.y, style);

    //Main loop
    while (window->Closed() == false)
    {
        if (window->KeyDown(KEY_ESCAPE)) break;
    }
    return 0;
}
```
