# Window.ClientSize

This method returns the dimensions of the drawable area inside a window, excluding the title bar and borders.

## Syntax

- [Vec2](Vec2.md) **ClientSize**()

## Returns

Returns the window client size.

## Example

```csharp
using System;
using Ultraviolet;

namespace ExampleNamespace
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Ultraviolet.GetDisplays();

            //Create window
            var window = new UltravioletWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UltravioletWindowFlags.WINDOW_TITLEBAR | UltravioletWindowFlags.WINDOW_RESIZABLE);

            //Create user interface
            var ui = Ultraviolet.CreateInterface(window);

            //Display window size
            var sz = ui.Root.ClientSize();
            var label = new UltravioletControl("", 0, 0, sz.X, sz.Y, ui.Root, UltravioletControlFlags.LABEL_CENTER | UltravioletControlFlags.LABEL_MIDDLE);
            label.Layout = new Vector4(1, 1, 1, 1);

            sz = window.Size;
            var csz = window.ClientSize;
            label.Text = "Window size: " + sz.X + " x " + sz.Y + "\n\nClient size: " + csz.X + " x " + csz.Y;

            while (true)
            {
                var ev = Ultraviolet.WaitEvent();
                switch (ev.ID)
                {
                    case UltravioletEventID.EVENT_WINDOWSIZE:
                        sz = window.Size;
                        csz = window.ClientSize;
                        label.Text = "Window size: " + sz.X + " x " + sz.Y + "\n\nClient size: " + csz.X + " x " + csz.Y;
                        break;
                    case UltravioletEventID.EVENT_WINDOWCLOSE:
                        return;
                }
            }
        }
    }
}
```