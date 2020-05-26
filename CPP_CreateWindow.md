### Example ###
```c++
#include "pch.h"

using namespace Leadwerks;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();
    Vec2 displayscale = displays[0]->GetScale();

    //Create a window
    auto window = CreateWindow(displays[0], L"", 0, 0, 400 * displayscale.x, 300 * displayscale.y, WINDOW_TITLEBAR | WINDOW_CENTER);

    //Main loop
    while (window->Closed() == false)
    {
        if (window->KeyDown(KEY_ESCAPE)) break;
    }
    return 0;
}
```
