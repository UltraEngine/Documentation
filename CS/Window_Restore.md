# Window.Restore

This method restores a window that is minimized or maximized to its previous position and size.

## Syntax

- void **Restore**()

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Window.GetDisplays();

        //Create window
        var window = Window.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_RESIZABLE);

        //Create user interface
        var ui = Interface.CreateInterface(window);
        var sz = ui.root.ClientSize();
        var button = Button.CreateButton("Toggle Window", sz.x / 2 - 50, sz.y / 2 - 15, 100, 30, ui.root);

        while (true)
        {
            var ev = WaitEvent();
            switch (ev.id)
            {
                case EventType.EVENT_WINDOWSIZE:
                    sz = ui.root.ClientSize();
                    button.SetShape(sz.x / 2 - 50, sz.y / 2 - 15, 100, 30);
                    break;
                case EventType.EVENT_WIDGETACTION:
                    if (ev.source == button)
                    {
                        if (window.Maximized())
                        {
                            window.Restore();
                        }
                        else
                        {
                            window.Maximize();
                        }
                    }
                    break;
                case EventType.EVENT_WINDOWCLOSE:
                    return;
            }
        }

        return;
    }
}
```

Note: The modified code is compatible with the C# programming language.