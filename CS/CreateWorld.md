# CreateWorld

This function creates a new world object.

## Syntax

- [World](World.md) **CreateWorld**()

## Returns

Returns a new world object.

## Example

```csharp
using System;
using UltraEngine;

namespace MyGame
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Display.GetDisplays();

            //Create window
            var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

            //Create world
            var world = CreateWorld();

            //Create framebuffer
            var framebuffer = CreateFramebuffer(window);

            //Create a camera
            var camera = CreateCamera(world, ProjectionType.PROJECTION_ORTHOGRAPHIC);
            camera.SetClearColor(0.125f);

            while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
            {
                world.Update();
                world.Render(framebuffer);
            }

            return 0;
        }
    }
}
```
Note: The C# code assumes that the necessary namespaces (`System` and `UltraEngine`) have been imported. Additionally, the C++ code uses the `using namespace` directive to avoid having to explicitly specify the namespace for each function call, whereas in C# the namespace needs to be specified explicitly for each function call.