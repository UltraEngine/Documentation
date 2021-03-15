# TransformCoord

This function transforms a screen coordinate from one window to another, from a window to the desktop, or from the desktop to a window.

## Syntax

- [iVec2](iVec2.md) **TransformCoord**(const int x, const int y, shared_ptr<[Window](Window.md)\> src, shared_ptr<[Window](Window.md)\> dst)
- [iVec2](iVec2.md) **TransformCoord**(const [iVec2](iVec2.md)& coord, shared_ptr<[Window](Window.md)\> src, shared_ptr<[Window](Window.md)\> dst)

| Parameter | Description |
| --- | --- |
| x | X component of the coordinate to transform |
| y | Y component of the coordinate to transform |
| coord | coordinate to transform |
| src | source window to transform the coordinate from, or NULL for the desktop |
| dst | destination window to transform the coordinate to, or NULL for the desktop |

## Returns

Returns the transformed coordinate relative to the destination window.

## Example

```c++
//-------------------------------------------------------------------------------------------------
//
// This example shows two windows with their positions transformed to each other's client area
//
//-------------------------------------------------------------------------------------------------

#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create windows
    auto window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);
    auto window2 = CreateWindow("Window 2", 200, 200, 640, 480, displays[0]);

    iVec2 pos;
    pos = TransformCoord(window1->GetPosition(), NULL, window2);
    window1->SetText("Window 1: " + String(pos.x) + ", " + String(pos.y));
    pos = TransformCoord(window2->GetPosition(), NULL, window1);
    window2->SetText("Window 2: " + String(pos.x) + ", " + String(pos.y));

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWMOVE:
            pos = TransformCoord(window1->GetPosition(), NULL, window2);
            window1->SetText("Window 1: " + String(pos.x) + ", " + String(pos.y));
            pos = TransformCoord(window2->GetPosition(), NULL, window1);
            window2->SetText("Window 2: " + String(pos.x) + ", " + String(pos.y));
            break;
        case EVENT_WINDOWCLOSE:
            return 0;
            break;
        }
    }

    return 0;
}
```
