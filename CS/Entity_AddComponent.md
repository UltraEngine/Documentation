# Entity.AddComponent

This method adds a component to the entity.

## Syntax

- **T AddComponent&lt;T&gt;**()
- **Component AddComponent**(string name)
- **Component AddComponent**(ComponentHooks hooks, IntPtr extra)

| Parameter | Description |
|---|---|
| T | C# type, must be derived from the [Component](Component.md) class |
| name | name of a Lua component |
| hooks | structure containing function pointers, for use with other languages |
| extra | external pointer or ID, for use with other languages |

## Returns

Returns a new component if successful, otherwise NULL is returned.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create a camera
        var camera = UltraEngine.CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.SetPosition(0, 0, -3);

        //Create a light
        var light = UltraEngine.CreateBoxLight(world);
        light.SetRotation(35, 45, 0);
        light.SetRange(-10, 10);

        //Create a box
        var box = UltraEngine.CreateBox(world);
        box.SetColor(0, 0, 1);

        //Entity component system
        var component = box.AddComponent<Mover>();
        component.rotationspeed.y = 45;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```