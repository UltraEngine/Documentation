# Window::Close

This method sets the window closed state to true. You can use this to simulate the user closing the window. The window will not be hidden automatically, and no event will be emitted.

## Syntax

- void **Close**()

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

    while (!window->Closed())
    {
        WaitEvent();
    }
    return 0;
}
```
