# CreateBoxLight

This function creates a new box light.

## Syntax

- `Light` **CreateBoxLight**(`World` world)

| Parameter | Description |
|---|---|
| world | world to create the light in |

## Returns

Returns a new light.

## Example

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static UltraEngine.Net;

namespace UltraEngineNetExample
{
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
            Light light = CreateBoxLight(world);
            light.SetRotation(90, 0, 0);
            light.SetRange(-10, 10);
            light.SetArea(5, 5);

            //Create ground
            var ground = CreateBox(world, 20, 1, 20);
            ground.SetPosition(0, -0.5, 0);
            ground.SetColor(0, 1, 0);

            //Main loop
            while (window.Closed() == false)
            {
                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```