# Window.SetMousePosition

This method moves the mouse pointer to the specified window coordinate.

## Syntax

- void **SetMousePosition**(int x, int y)
- void **SetMousePosition**([iVec2](iVec2.md) coords)

| Parameter | Description |
|---|---|
| x | X component of the destination coordinates |
| y | Y component of the destination coordinates |
| coords | destination coordinates |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Engine.CreateInterface(window);
        var sz = ui.root.ClientSize();
        var panel = Engine.CreatePanel(100, 100, sz.x - 200, sz.y - 200, ui.root);
        panel.SetColor(0, 0, 0, 1);
        panel.SetPointer(Engine.POINTER_CROSS);
        var label = Engine.CreateLabel("Click on the black panel to center the mouse",0,43,sz.x,30,ui.root,Engine.LABEL_CENTER);

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case Engine.EVENT_MOUSEDOWN:
                    if (ev.source == panel)
                    {
                        var pos = panel.position;
                        var sz = panel.size;
                        window.SetMousePosition(pos.x + sz.x / 2, pos.y + sz.y / 2);
                    }
                    break;
                case Engine.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```