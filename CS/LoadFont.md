# LoadFont

This function loads a font from a file path or stream.

## Syntax

- `Font LoadFont(string path, LoadFlags flags = LOAD_DEFAULT)`
- `Font LoadFont(Stream stream, LoadFlags flags = LOAD_DEFAULT)`

| Parameter | Description |
|---|---|
| path | file path to load |
| stream | stream to read from |
| flags | loading options, can be LOAD_DEFAULT or LOAD_NO_CACHE |

## Returns

Returns the loaded font, or `null` of the font could not be loaded.

## Example

```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = UltraEngine.GetDisplays();

        //Create a window
        var window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_CENTER);

        //Create a framebuffer
        var framebuffer = UltraEngine.CreateFramebuffer(window);

        //Create a world
        var world = UltraEngine.CreateWorld();

        //Create a camera
        var camera = UltraEngine.CreateCamera(world, ProjectionType.PROJECTION_ORTHOGRAPHIC);
        camera.SetClearColor(0.125f);

        //Create sprite
        const int fontsize = 36;
        var font = UltraEngine.LoadFont("Fonts/arial.ttf");
        var sprite = UltraEngine.CreateSprite(world, font, "Hello, World!", fontsize);
        var rect = UltraEngine.CreateSprite(world, font.GetTextWidth("Hello, World!", fontsize), font.GetHeight(fontsize), true);

        //Center the text relative tot he camera
        camera.SetPosition(sprite.GetBounds().center);

        //Main loop
        while (!window.Closed() && !window.KeyHit(Keys.KEY_ESCAPE))
        {
            //Update world
            world.Update();

            //Render world
            world.Render(framebuffer, true);
        }
    }
}
```