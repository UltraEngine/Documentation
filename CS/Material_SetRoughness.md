# Material.SetRoughness

This method sets the roughness of a material. A material with low roughness will appear more reflective than a rough surface.

## Syntax

- void **SetRoughness**(float roughness)

| Parameter | Description |
|---|---|
| roughness | surface roughness between 0 and 1 |

## Example

![Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/material_setroughness.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowMode.CENTER | WindowMode.TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        camera.SetPosition(0, 0, -10);
        camera.SetFOV(50);

        var specmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds");
        var diffmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/diffuse.dds");

        world.SetEnvironmentMap(specmap, EnvironmentMapType.SPECULAR);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.DIFFUSE);

        var models = new List<Entity>();

        for (int x = 0; x < 4; ++x)
        {
            for (int y = 0; y < 4; ++y)
            {
                var mtl = Material.Create();
                mtl.SetRoughness((float)x / 3.0f);
                mtl.SetMetalness((float)y / 3.0f);

                var ball = Sphere.Create(world);
                ball.SetPosition(x * 2.0f - 3.0f, y * 2.0f - 3.0f, 0);
                ball.SetMaterial(mtl);
                models.Add(ball);
            }
        }

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```