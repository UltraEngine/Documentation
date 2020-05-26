# CreateWindow #
This function is used to create a new window.

## Syntax ##
- shared_ptr\<[Window](CPP_Window)\> **CreateWindow**(shared_ptr\<[Display](CPP_Display)\> display, const string& title, const int x, const int y, const int width, const int height, const WindowStyle style = WINDOW_TITLEBAR, shared_ptr\<[Window](CPP_Window)\> parent = NULL);
- shared_ptr\<[Window](CPP_Window)\> **CreateWindow**(shared_ptr\<[Display](CPP_Display)\> display, const wstring& title, const int x, const int y, const int width, const int height, const WindowStyle style = WINDOW_TITLEBAR, shared_ptr\<[Window](CPP_Window)\> parent = NULL);

### Parameters
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
#include "Project.h"

using namespace Leadwerks;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();
    Vec2 displayscale = displays[0]->GetScale();

    //Create a window
    auto window = CreateWindow(displays[0], "Window", 0, 0, 400 * displayscale.x, 300 * displayscale.y, WINDOW_TITLEBAR | WINDOW_CENTER);

    //Main loop
    while (window->Closed() == false)
    {
        if (window->KeyDown(KEY_ESCAPE)) break;
    }
    return 0;
}
```
