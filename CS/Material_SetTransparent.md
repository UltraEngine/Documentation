# Material.SetTransparent

This method sets the transparency mode of the material.

## Syntax

- void **SetTransparent**(bool mode)

| Parameter | Description |
|---|---|
| mode | true for transparent materials, false for opaque |

## Example

![refraction](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/refraction.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    const string remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets";

    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.Center | WindowStyle.Titlebar);

        //Create framebuffer
        var framebuffer = Framebuffer.Create(window);
        framebuffer.GetSize();

        //Create world
        var world = World.Create();
        world.SetAmbientLight(0.05);

        //Set environment maps
        var specmap = Texture.Load(remotepath + "/Materials/Environment/Storm/specular.dds");
        var diffmap = Texture.Load(remotepath + "/Materials/Environment/Storm/diffuse.dds");
        world.SetEnvironmentMap(specmap, EnvironmentMapType.Background);
        world.SetEnvironmentMap(specmap, EnvironmentMapType.Specular);
        world.SetEnvironmentMap(diffmap, EnvironmentMapType.Diffuse);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRotation(45, 35, 0);
        light.SetArea(30, 30);
        light.SetRange(-20, 20);

        //Create camera
        var camera = Camera.Create(world);
        camera.SetFOV(70);
        camera.SetPosition(0, 1.5, -4);
        camera.SetClearColor(0.125);
        camera.SetRefraction(true);

        //Create the scene
        var floor = Box.Create(world, 20, 1, 20);
        floor.SetPosition(0, -0.5f, 0);
        var floormtl = Material.Create();
        floormtl.SetTexture(Texture.Load(remotepath + "/Materials/tiles.dds"));
        floor.SetMaterial(floormtl);

        var drag = Model.LoadModel(world, remotepath + "/Models/Stanford/dragon.glb");
        drag.SetScale(0.1f);
        drag.SetColor(1, 1, 1, 1, true);

        //Transparent material
        var mtl = Material.Create();
        mtl.SetColor(1, 1, 1, 0.5);
        mtl.SetMetalness(0.5);
        mtl.SetRoughness(0.5);
        mtl.SetTransparent(true);
        drag.SetMaterial(mtl, true);

        Vec3 camerarotation;
        var axis = window.GetMouseAxis();

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.Escape))
        {
            //Camera rotate controls
            var newpos = window.GetMouseAxis();
            var diff = newpos - axis;
            axis = newpos;
            camerarotation.x += diff.y * 50.0f;
            camerarotation.y += diff.x * 50.0f;
            camera.SetPosition(0, 1.5, 0);
            camera.SetRotation(camerarotation);
            camera.Move(0, 0, -4);

            world.Update();
            world.Render(framebuffer, true);
        }
    }
}
```