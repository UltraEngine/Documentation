# Terrain.GetSlope

This method gets the terrain slope at the specified coordinate or 3D position.

## Syntax

- float **GetSlope**(int tx, int ty)
- float **GetSlope**([iVec2](iVec2.md) coord)
- float **GetSlope**([xVec3](xVec3.md) coord)
- float **GetSlope**(float x, float y, float z)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | position in global space |

## Returns

Returns the terrain slope in degrees at the specified coordinate or the interpolated normal at the specified position in global space.

## Example

This example applies a material to a terrain based on the slope at each point.

![image](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/Terrain_GetSlope.jpg)

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UltraEngine;

namespace TerrainPaint
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the display list
            var displays = Displays.GetDisplays();

            //Create a window
            var window = Window.Create("Terrain Paint", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

            //Create a world
            var world = World.Create();
            world.SetAmbientLight(0);

            //Create a framebuffer
            var framebuffer = Framebuffer.Create(window);

            //Create a camera
            var camera = Camera.Create(world);
            camera.SetFov(70);
            camera.SetPosition(0, 50, 0);
            camera.SetRotation(45, 0, 0);
            camera.SetClearColor(0.125f);

            //Create a light
            var light = DirectionalLight.Create(world);
            light.SetRotation(35, 45, 0);
            light.SetColor(2);

            //Create terrain
            var terrain = Terrain.Create(world, 512);
            terrain.LoadHeightmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Terrain/512.r16");
            terrain.SetScale(1, 100, 1);

            //Create base material
            var ground = Material.Create();
            var diffusemap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
            var normalmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
            ground.SetTexture(diffusemap, TextureSlot.TEXTURE_DIFFUSE);
            ground.SetTexture(normalmap, TextureSlot.TEXTURE_NORMAL);
            terrain.SetMaterial(ground);

            //Create paint material
            var rocks = Material.Create();
            diffusemap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds");
            normalmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds");
            var dispmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds");
            rocks.SetTexture(diffusemap, TextureSlot.TEXTURE_DIFFUSE);
            rocks.SetTexture(normalmap, TextureSlot.TEXTURE_NORMAL);
            rocks.SetTexture(dispmap, TextureSlot.TEXTURE_DISPLACEMENT);

            //Apply material based on terrain slope
            for (int x = 0; x < terrain.resolution.x; ++x)
            {
                for (int y = 0; y < terrain.resolution.y; ++y)
                {
                    float slope = terrain.GetSlope(x, y);
                    if (slope > 15.0f)
                    {
                        float wt = Math.Min((slope - 15.0f) / 10.0f, 1.0f);
                        terrain.SetMaterial(x, y, rocks, wt);
                    }
                }
            }

            //Camera controls
            camera.AddComponent<CameraControls>();

            //Main loop
            while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
            {
                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```