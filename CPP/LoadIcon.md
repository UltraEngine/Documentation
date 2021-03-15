# LoadIcon

This functions loads a vector image from a file path or stream.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **LoadIcon**(const WString& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Pixmap](Pixmap.md)\> **LoadIcon**(const [Stream](Stream.md) stream, const LoadFlags flags = LOAD_DEFAULT)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create a pixmap
    auto icon = LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg");

    //Show the icon
    ui->root->SetIcon(icon);

    while (true)
    {
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
