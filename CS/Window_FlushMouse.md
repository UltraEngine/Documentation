# Window.FlushMouse

This method resets the mouse button states, the mouse wheel position, and the raw mouse movement.

## Syntax

- void **FlushMouse**()

## Example

```csharp
using System;
using Ultraviolet;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Ultraviolet.GetDisplays();

        //Create window
        var window = Application.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Application.CreateUI(window);
        var sz = ui.Root.ClientSize;
        var label = UIBuilder.CreateLabel("Click on the window", sz.X / 2 - 75, sz.Y / 2 - 15, 150, 30, ui.Root);

        while (true)
        {
            var ev = Ultraviolet.QueueAndWaitForEvent();
            switch (ev.EventType)
            {
                case UltravioletEventType.MouseButtonDown:
                    if (ev.Source == window)
                    {
                        //This call to FlushMouse() resets the muose hit state so it will not be detected:
                        window.FlushMouse();

                        Console.WriteLine("MouseHit: " + window.GetMouseButtonState(MouseButton.Left));
                    }
                    break;

                case UltravioletEventType.WindowClose:
                    return;
                    break;
            }
        }
    }
}
```