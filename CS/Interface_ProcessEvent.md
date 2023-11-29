## Interface.ProcessEvent

This method sends an event to an interface to be evaluated.

### Syntax

```csharp
void ProcessEvent(Event ev)
```

| Parameter | Description |
|---|---|
| ev | event to be evaluated |

## Remarks

When an interface is created directly on a window it will automatically receive events from the window. However, when an interface is created to appear in a 3D rendering viewport, events must be manually sent to the interfaces. This allows the user to make changes to events. For example, the coordinates of a mouse event can be transform from 3D space to coordinates on a panel in the 3D world.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create framebuffer
        var framebuffer = window.CreateFramebuffer();

        //Create world
        var world = World.Create();

        //Load a font
        var font = Font.Load("Fonts/arial.ttf");

        //Create user interface
        var ui = Interface.Create(world, font, framebuffer.Size);

        //Create widget
        iVec2 sz = ui.root.ClientSize();
        var button = Button.Create("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root);

        //Create camera
        var camera = Camera.Create(world, PROJECTION_ORTHOGRAPHIC);
        camera.Position = new Vec3(framebuffer.Size.x / 2, framebuffer.Size.y / 2, 0);

        while (true)
        {
            while (PeekEvent())
            {
                var ev = WaitEvent();
                switch (ev.id)
                {
                    case EVENT_WINDOWCLOSE:
                        if (ev.source == window)
                        {
                            return;
                        }
                        break;
                    default:
                        ui.ProcessEvent(ev);
                        break;
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```