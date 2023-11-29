# TransformCoord

This function transforms a screen coordinate from one window to another, from a window to the desktop, or from the desktop to a window.

## Syntax

- [Vector2](Vector2.md) **TransformCoord**(int x, int y, [Window](Window.md) src, [Window](Window.md) dst)
- [Vector2](Vector2.md) **TransformCoord**([Vector2](Vector2.md) coord, [Window](Window.md) src, [Window](Window.md) dst)

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

```csharp
//-------------------------------------------------------------------------------------------------
//
// This example shows two windows with their positions transformed to each other's client area
//
//-------------------------------------------------------------------------------------------------

using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.ListDisplays();

        //Create windows
        var window1 = Window.CreateWindow("Window 1", 0, 0, 640, 480, displays[0]);
        var window2 = Window.CreateWindow("Window 2", 200, 200, 640, 480, displays[0]);

        Vector2 pos;
        pos = TransformCoord(window1.GetPosition(), null, window2);
        window1.SetText("Window 1: " + pos.x + ", " + pos.y);
        pos = TransformCoord(window2.GetPosition(), null, window1);
        window2.SetText("Window 2: " + pos.x + ", " + pos.y);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventId.WindowMove:
                    pos = TransformCoord(window1.GetPosition(), null, window2);
                    window1.SetText("Window 1: " + pos.x + ", " + pos.y);
                    pos = TransformCoord(window2.GetPosition(), null, window1);
                    window2.SetText("Window 2: " + pos.x + ", " + pos.y);
                    break;
                case EventId.WindowClose:
                    return;
            }
        }
    }
}
```