# CreateInterface

This function creates a new graphical user interface for desktop applications or in-game interfaces.

## Syntax

- `Interface CreateInterface(Window window)`
- `Interface CreateInterface(World world, Font font, Vector2 size)`

| Parameter | Description |
| --- | --- |
| window | window to create the user interface on |
| world | world to create the interface in, for 3D graphics |
| font | font to use, for 3D graphics |
| size | interface dimensions, for 3D graphics |

## Returns

Returns a new interface object.

## Example

Four examples are shown below to demonstrate different types of programs you can create.

The first example shows how to create an interface directly on a window for an event-based desktop application.

```csharp
using System;
using UltaEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create user interface
        var ui = Engine.CreateInterface(window);

        //Create widget
        Vector2 sz = ui.Root.ClientSize();
        var button = Engine.CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.Root);

        while (true)
        {
            var ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case EventType.EVENT_WINDOWCLOSE:
                    if (ev.source == window)
                    {
                        return;
                    }
                    break;
            }
        }
    }
}
```

The second example shows how to create an interface that appears in a 3D rendering viewport. Note that in this example you must send events to the interface with the `Interface.ProcessEvent` method.

```csharp
using System;
using UltaEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create world
        var world = Engine.CreateWorld();

        //Load a font
        var font = Engine.LoadFont("Fonts/arial.ttf");

        //Create user interface
        var ui = Engine.CreateInterface(world, font, framebuffer.Size);

        //Create widget
        Vector2 sz = ui.Root.ClientSize();
        var button = Engine.CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.Root);

        //Create camera
        var camera = Engine.CreateCamera(world, ProjectionType.PROJECTION_ORTHOGRAPHIC);
        camera.SetPosition(framebuffer.Size.x * 0.5f, framebuffer.Size.y * 0.5f, 0);

        while (true)
        {
            while (Engine.PeekEvent())
            {
                var ev = Engine.WaitEvent();
                switch (ev.id)
                {
                    case EventType.EVENT_WINDOWCLOSE:
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

The last example shows how to create an interactive user interface that is displayed on a 3D surface:

```csharp
using System;
using UltaEngine;
using UltaEngine.Components.Player;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

        //Create framebuffer
        var framebuffer = Engine.CreateFramebuffer(window);

        //Create world
        var world = Engine.CreateWorld();

        //Load a font
        var font = Engine.LoadFont("Fonts/arial.ttf");

        //Create a camera
        var camera = Engine.CreateCamera(world);
        camera.SetPosition(0, 0, -2);
        camera.SetClearColor(0.125f);

        //Camera controls
        var actor = Engine.CreateActor(camera);
        actor.AddComponent<CameraControls>();

        //Create a model
        var box = Engine.CreateBox(world);
        box.SetRotation(0, 45, 0);
        box.SetPickMode(PickMode.PICK_MESH);

        //Create light
        var light = Engine.CreateBoxLight(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetColor(4);

        //Create user interface
        var ui = Engine.CreateInterface(world, font, new Vector2(256));
        ui.SetRenderLayers(2);

        //Create widget
        Vector2 sz = ui.Root.ClientSize();
        var button = Engine.CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.Root);

        //Create camera
        var uicamera = Engine.CreateCamera(world, ProjectionType.PROJECTION_ORTHOGRAPHIC);
        uicamera.SetClearColor(1, 0, 0, 1);
        uicamera.SetPosition(128.0f, 128.0f, 0);
        uicamera.SetRenderLayers(2);
        uicamera.SetRealtime(false);

        var texbuffer = Engine.CreateTextureBuffer(256, 256);
        uicamera.SetRenderTarget(texbuffer);

        var mtl = Engine.CreateMaterial();
        mtl.SetTexture(texbuffer.GetColorAttachment(0));
        box.SetMaterial(mtl);

        while (window.Closed() == false && window.KeyDown(Key.KEY_ESCAPE) == false)
        {
            while (Engine.PeekEvent())
            {
                var ev = Engine.WaitEvent();
                switch (ev.id)
                {
                    case EventType.EVENT_MOUSEDOWN:
                    case EventType.EVENT_MOUSEUP:
                    case EventType.EVENT_MOUSEMOVE:
                        var pick = camera.Pick(framebuffer, ev.position.x, ev.position.y, 0, true);
                        if (pick.success && pick.entity == box)
                        {
                            ev.position.x = Math.Round(pick.texcoords[0].x * 256.0f);
                            ev.position.y = Math.Round(pick.texcoords[0].y * 256.0f);
                            ui.ProcessEvent(ev);
                            uicamera.Render();
                        }
                        break;
                }
            }

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```