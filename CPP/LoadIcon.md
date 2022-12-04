# LoadIcon

This functions loads a vector image from a file path or stream.

## Syntax

- shared_ptr<[Icon](Icon.md)\> **LoadIcon**(const WString& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Icon](Icon.md)\> **LoadIcon**(shared_ptr<[Stream](Stream.md)\> stream, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load the icon from |
| stream | stream to load the icon from |
| flags | optional loading flags |

## Returns

Returns the loaded icon object if successful, otherwise NULL is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create a pixmap
    auto icon = LoadIcon("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Logos/23.svg");

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
