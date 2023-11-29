```csharp
using System;
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

        //Create sprite
        var sprite = LoadSprite(world, "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Sprites/nightraider.dds");
        sprite.SetPosition(-sprite.size.x * 0.5f, -sprite.size.y * 0.5f);
        sprite.mesh.material.SetAlphaMask(true);

        //Main loop
        while (window.Closed() == false && window.KeyHit(KEY_ESCAPE) == false)
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```