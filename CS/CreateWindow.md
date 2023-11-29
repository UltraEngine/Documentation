```csharp
using System;
using UltaEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the display
        var displays = Display.GetDisplays();
        Vec2 displayscale = displays[0].GetScale();

        //Create a window
        var style = WindowStyle.WINDOW_TITLEBAR | WindowStyle.WINDOW_CENTER;
        var window = CreateWindow("Example", 0, 0, 400 * displayscale.x, 300 * displayscale.y, displays[0], style);

        //Main loop
        while (window.Closed() == false)
        {
            if (window.KeyDown(KEY_ESCAPE)) break;
        }
    }
}
```