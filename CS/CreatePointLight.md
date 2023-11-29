# CreatePointLight

This function creates a new point light.

## Syntax

- PointLight **CreatePointLight**(World world, float range = 5.0f)

| Parameter | Description |
|---|---|
| world | world to create the light in |
| range | light range |

## Returns

Returns a new light.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetFOV(70);
        camera.Move(0, 2, -8);

        //Create light
        var light = CreatePointLight(world);
        light.SetPosition(0, 3, 0);
        light.SetColor(2);

        //Create ground
        var ground = CreateBox(world, 20, 1, 20);
        ground.SetPosition(0, -0.5, 0);
        ground.SetColor(0, 1, 0);

        //Main loop
        while (!window.Closed() && !window.KeyHit(KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```