### Terrain.SetTileHidden

This method is used to show or hide a single terrain tile.

## Syntax

- **void** SetTileHidden(**int** x, **int** y, **bool** hidden)
- **void** SetTileHidden([iVec2](iVec2.md) coord, **bool** hidden)

| Parameter | Description |
|---|---|
| coord, (x, y) | tile coordinate |
| hidden | if set to true the tile will be hidden, otherwise it will be visible |

## Example

This example lets you cut holes in the terrain.

![Example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/terrain_settilehidden.jpg)

```csharp
using UltraEngine;
using UltraEngine.Core;

public class TerrainCut
{
    static void Main(string[] args)
    {
        //Get the display list
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Terrain Cut", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetFov(70);
        camera.SetPosition(0, 100, -100);
        camera.SetRotation(45, 0, 0);
        camera.SetClearColor(0.125f);

        //Sunlight
        var light = DirectionalLight.Create(world);
        light.SetRotation(45, 35, 0);
        light.SetColor(2);

        //Create terrain
        var terrain = Terrain.Create(world, 512);
        terrain.LoadHeightmap("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Terrain/512.r16");
        terrain.SetScale(1, 100, 1);

        //Create base material
        var ground = Material.Create();
        var diffusemap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_diff_4k.dds");
        var normalmap = Texture.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/river_small_rocks_nor_gl_4k.dds");
        ground.SetTexture(diffusemap, TextureType.TEXTURE_DIFFUSE);
        ground.SetTexture(normalmap, TextureType.TEXTURE_NORMAL);
        terrain.SetMaterial(ground);

        //Camera controls
        camera.AddComponent<CameraControls>();

        //Main loop
        while (!window.Closed && !window.KeyDown(Key.KEY_ESCAPE))
        {
            if (window.MouseDown(MouseButton.MOUSE_LEFT))
            {
                var mousepos = window.GetMousePosition();
                var pickinfo = camera.Pick(framebuffer, mousepos.x, mousepos.y);
                if (pickinfo.success)
                {
                    if (pickinfo.entity == terrain)
                    {
                        iVec2 pos;
                        pos.x = Round(pickinfo.position.x) + terrain.resolution.x / 2;
                        pos.y = Round(pickinfo.position.z) + terrain.resolution.y / 2;
                        int radius = 10;
                        for (int x = pos.x - radius; x < pos.x + radius; ++x)
                        {
                            for (int y = pos.y - radius; y < pos.y + radius; ++y)
                            {
                                terrain.SetTileHidden(x, y, !window.KeyDown(Key.KEY_CONTROL));
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
```