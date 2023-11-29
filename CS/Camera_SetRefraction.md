# Camera.SetRefraction

This method enables or disables the transparency refraction setting for the camera. This effect will make transparent surfaces appear to bend light as it passes through them.

- void **SetRefraction**(bool mode)

| Parameter | Description |
|---|---|
| mode | true to enable transparency refraction or false to disable it |

## Example

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/refraction.jpg)

```csharp
using System;
using UltraEngine;

namespace Documentation
{
    class Program
    {
        static void Main(string[] args)
        {
            var windowHeight = 720;
            var windowWidth = 1280;

            //Get the displays
            var displays = Display.GetDisplays();

            //Create window
            var window = new Window("Ultra Engine", 0, 0, windowWidth, windowHeight, displays[0], WindowFlags.Center | WindowFlags.TitleBar);

            //Create framebuffer
            var framebuffer = new Framebuffer(window);
            framebuffer.GetSize();

            //Create world
            var world = new World();
            world.SetAmbientLight(0.05);

            //Set environment maps
            var specmap = new Texture();
            specmap.Load(remotepath + "/Materials/Environment/Storm/specular.dds");
            var diffmap = new Texture();
            diffmap.Load(remotepath + "/Materials/Environment/Storm/diffuse.dds");
            world.SetEnvironmentMap(specmap, EnvironmentMapType.Background);
            world.SetEnvironmentMap(specmap, EnvironmentMapType.Specular);
            world.SetEnvironmentMap(diffmap, EnvironmentMapType.Diffuse);
            
            //Create light
            var light = new BoxLight(world);
            light.SetRotation(45, 35, 0);
            light.SetArea(30, 30);
            light.SetRange(-20, 20);

            //Create camera
            var camera = new Camera(world);
            camera.SetFov(70);
            camera.SetPosition(0, 1.5, -4);
            camera.SetClearColor(0.125);
            camera.SetRefraction(true);

            //Create the scene
            var floor = new Box(world, 20, 1, 20);
            floor.SetPosition(0, -0.5f, 0);
            var floormtl = new Material();
            floormtl.SetTexture(new Texture(remotepath + "/Materials/tiles.dds"));
            floor.SetMaterial(floormtl);

            var drag = new Model(world, remotepath + "/Models/Stanford/dragon.glb");
            drag.SetScale(0.1f);
            drag.SetColor(1, 1, 1, 1, true);
            
            //Transparent material
            var mtl = new Material();
            mtl.SetColor(1, 1, 1, 0.5);
            mtl.SetMetalness(0.5);
            mtl.SetRoughness(0.5);
            mtl.SetTransparent(true);
            drag.SetMaterial(mtl, true);

            Vec3 camerarotation;
            Vec3 axis = window.GetMouseAxis();

            //Main loop
            while (!window.Closed() && !window.KeyDown(Key.Escape))
            {
                //Camera rotate controls
                var newpos = window.GetMouseAxis();
                var diff = newpos - axis;
                axis = newpos;
                camerarotation.x += diff.y * 100.0f;
                camerarotation.y += diff.x * 100.0f;
                camera.SetPosition(0, 1.5, 0);
                camera.SetRotation(camerarotation);
                camera.Move(0, 0, -4);

                world.Update();
                world.Render(framebuffer, true);
            }
        }
    }
}
```