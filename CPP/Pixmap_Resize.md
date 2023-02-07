# Pixmap::Resize

This method resizes a pixmap to make it larger or smaller.

## Syntax

- shared_ptr<[Pixmap](Pixmap.md)\> **Resize**(const int width, const int height)
- bool **Resize**(const int width, const int height, shared_ptr<[Pixmap](Pixmap.md)\> dst)

| Parameter | Description |
|---|---|
| width, height | resize dimensions |
| dst | destination pixmap to write to |

## Returns

This method returns a new pixmap or a boolean indicating success or failure, depending on which overload is used.

If the destination pixmap's dimensions don't match the specified width and height, false is returned.

If the destination pixmap's format don't match the pixmap's format, false is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create a pixmap
    auto pixmap = LoadPixmap("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds");
    
    //Resize the pixmap
    pixmap = pixmap->Resize(128, 128);

    //Show the pixmap
    ui->root->SetPixmap(pixmap);

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
