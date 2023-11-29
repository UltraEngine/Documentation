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
            var displays = UltraEngine.GetDisplays();

            //Create a window
            var window = UltraEngine.CreateWindow("Terrain Paint", 0, 0, 1280, 720, displays[0], UltraEngine.WINDOW_CENTER | UltraEngine.WINDOW_TITLEBAR);

            //Create a world
            var world = UltraEngine.CreateWorld();
            world.SetAmbientLight(0);

            //Create a framebuffer
            var framebuffer = UltraEngine.CreateFramebuffer(window);

            //Create a camera
            var camera = UltraEngine.CreateCamera(world);
            camera.SetFov(70);
            camera.SetPosition(0, 100, -100);
            camera.SetRotation(45, 0, 0);
            camera.SetClearColor(0.125);

            //Sunlight
            var light = UltraEngine.CreateDirectionalLight(world);
            light.SetRotation(45, 35, 0);
            light.SetColor(2);

            //Create terrain
            var terrain = UltraEngine.CreateTerrain(world, 512);
            terrain.LoadHeightmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Terrain/512.r16");
            terrain.SetScale(1, 100, 1);

            //Create base material
            var ground = UltraEngine.CreateMaterial();
            var diffusemap = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
            var normalmap = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
            ground.SetTexture(diffusemap, UltraEngine.TEXTURE_DIFFUSE);
            ground.SetTexture(normalmap, UltraEngine.TEXTURE_NORMAL);
            int baselayer = terrain.AddLayer(ground);
            terrain.Fill(baselayer);
            terrain.SetLayerScale(baselayer, 4);

            //Create paint material
            var rocks = UltraEngine.CreateMaterial();
            diffusemap = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k.dds");
            normalmap = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_dot3.dds");
            var dispmap = UltraEngine.LoadTexture("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/Rocks_Dirt_Ground_2k_disp.dds");
            rocks.SetTexture(diffusemap, UltraEngine.TEXTURE_DIFFUSE);
            rocks.SetTexture(normalmap, UltraEngine.TEXTURE_NORMAL);
            rocks.SetTexture(dispmap, UltraEngine.TEXTURE_DISPLACEMENT);
            int paintlayer = terrain.AddLayer(rocks);
            terrain.SetLayerScale(paintlayer, 8);

            //Camera controls
            camera.AddComponent<CameraControls>();

            //Main loop
            while (window.Closed() == false && window.KeyDown(UltraEngine.KEY_ESCAPE) == false)
            {
                if (window.MouseDown(UltraEngine.MOUSE_LEFT))
                {
                    var mousepos = window.GetMousePosition();
                    var pickinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                    if (pickinfo.success)
                    {
                        if (pickinfo.entity == terrain)
                        {
                            iVec2 pos;
                            pos.x = MathUtils.RoundToInt(pickinfo.position.x) + terrain.resolution.x / 2;
                            pos.y = MathUtils.RoundToInt(pickinfo.position.z) + terrain.resolution.y / 2;
                            int radius = 10;
                            for (int x = pos.x - radius; x < pos.x + radius; ++x)
                            {
                                for (int y = pos.y - radius; y < pos.y + radius; ++y)
                                {
                                    float strength = 1.0f - Vec3.DistanceToPoint(new Vec3(x, y, 0), new Vec3(pos.x, pos.y, 0)) / (float)radius;
                                    if (strength <= 0.0f) continue;
                                    float wt = terrain.GetLayerWeight(paintlayer, x, y);
                                    wt += 0.1f;
                                    terrain.SetLayerWeight(paintlayer, x, y, wt);
                                }
                            }
                        }
                    }
                }
                world.Update();
                world.Render(framebuffer);
            }
        }
    }
}
```
