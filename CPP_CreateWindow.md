# CreateWindow #
This function is used to create a new window.

## Syntax ##
- shared_ptr<[Window](CPP_Window)\> **CreateWindow**(shared_ptr<[Display](CPP_Display)\> display, const string& title, const int x, const int y, const int width, const int height, const [WindowStyle](CPP_Window) style = WINDOW_TITLEBAR, shared_ptr<[Window](CPP_Window)\> parent = NULL)
- shared_ptr<[Window](CPP_Window)\> **CreateWindow**(shared_ptr<[Display](CPP_Display)\> display, const wstring& title, const int x, const int y, const int width, const int height, const [WindowStyle](CPP_Window) style = WINDOW_TITLEBAR, shared_ptr<[Window](CPP_Window)\> parent = NULL)

## Parameters ##
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
