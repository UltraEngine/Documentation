# CreateProbe

This function creates a new environment probe.

## Syntax

```csharp
public Probe CreateProbe(World world)
```

| Parameter | Description |
|---|---|
| world | world to create the entity in |

## Returns

Returns a new probe entity.

## Example

![Example Image](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/probe.jpg)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace NewGameEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            List<Display> displays = Display.GetDisplays();

            //Create window
            Window window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

            //Create framebuffer
            Framebuffer framebuffer = new Framebuffer(window);
            framebuffer.GetSize();

            //Create world
            World world = new World();
            world.SetAmbientLight(0.05);

            //Set environment maps
            Texture specmap = new Texture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/specular.dds");
            Texture diffmap = new Texture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Environment/Storm/diffuse.dds");
            world.SetEnvironmentMap(specmap, EnvironmentMapType.ENVIRONMENTMAP_SPECULAR);
            world.SetEnvironmentMap(diffmap, EnvironmentMapType.ENVIRONMENTMAP_DIFFUSE);

            //Create light
            DirectionalLight light = new DirectionalLight(world);
            light.SetRotation(25, 315, 0);

            //Create camera
            Camera camera = new Camera(world);
            camera.SetFOV(70);
            camera.SetPosition(8, 2.5, 0);
            camera.SetClearColor(0.125f);

            //Create the scene
            Box wall = new Box(world, 10, 5, 0.5);
            wall.SetPosition(0, 2.5, 4.75);
            wall.SetColor(0, 1, 1);

            Box wall2 = new Box(world, 10, 5, 0.5);
            wall2.SetPosition(0, 2.5, -4.75);
            wall2.SetColor(1, 0, 0);

            Box wall3 = new Box(world, 0.5, 5, 9);
            wall3.SetPosition(-4.75, 2.5, 0);

            Box floor = new Box(world, 20, 1, 20);
            floor.SetPosition(0, -0.5f, 0);

            Box ceil = new Box(world, 10, 0.5f, 10);
            ceil.SetPosition(0, 5.25, 0);

            Model drag = new Model(world, "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Models/Stanford/dragon.glb");
            drag.SetScale(0.1f);
            drag.SetColor(1, 1, 1, 1, true);
            drag.SetReflection(false);
            Material mtl = new Material();
            mtl.SetMetalness(0.75);
            mtl.SetRoughness(0);
            drag.SetMaterial(mtl, true);

            //Create environment probe
            Probe probe = new Probe(world);
            probe.SetScale(9.5, 5, 9.5);
            probe.SetPosition(0, 2.5, 0);
            probe.SetFadeDistance(1, CubemapFace.CUBEMAP_POSITIVE_X);
            probe.SetFadeDistance(0, CubemapFace.CUBEMAP_NEGATIVE_X);
            probe.SetFadeDistance(0, CubemapFace.CUBEMAP_POSITIVE_Y);
            probe.SetFadeDistance(0, CubemapFace.CUBEMAP_NEGATIVE_Y);
            probe.SetFadeDistance(0, CubemapFace.CUBEMAP_POSITIVE_Z);
            probe.SetFadeDistance(0, CubemapFace.CUBEMAP_NEGATIVE_Z);

            //Camera controls
            Actor actor = new Actor(camera);
            actor.AddComponent<CameraControls>();

            //Main loop
            while (window.Closed() == false && window.KeyDown(Key.KEY_ESCAPE) == false)
            {
                world.Update();
                world.Render(framebuffer, true);
            }
        }
    }
}
```