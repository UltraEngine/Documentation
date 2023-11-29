```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create world
        var world = CreateWorld();

        //Create camera
        var camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
        camera.SetClearColor(0.125);
        camera.SetPosition(float(framebuffer.size.x) * 0.5f, float(framebuffer.size.y) * 0.5f, 0.0f);

        //Create sprite
        var sprite = CreateSprite(world, 100, 100);
        sprite.SetColor(0, 0, 1);
        sprite.SetPosition(10, 10, 0);

        //Main loop
        while (window.Closed() == false && window.KeyHit(KEY_ESCAPE) == false)
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```