# Font.GetHeight

This method returns the font's line height.

## Syntax

- int **GetHeight**(int size)

| Parameter | Description |
|---|---|
| size | font size |

## Returns

Returns the font's line height. For most fonts, this will be the distance between the base of a capital letter and its maximum height, known as the font *ascent*.

## Example

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
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera
        var camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
        camera.SetClearColor(0.125f);

        //Create sprite
        const int fontsize = 36;
        var font = LoadFont("Fonts/arial.ttf");
        var sprite = CreateSprite(world, font, "Hello, World!", fontsize);
        var rect = CreateSprite(world, font.GetTextWidth("Hello, World!", fontsize), font.GetHeight(fontsize), true);

        //Center the text relative tot he camera
        camera.SetPosition(sprite.GetBounds().center);

        //Main loop
        while (!window.Closed() && !window.KeyHit(KEY_ESCAPE))
        {
            //Update world
            world.Update();

            //Render world
            world.Render(framebuffer, true);
        }
    }
}
```