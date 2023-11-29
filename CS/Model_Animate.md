# Model.Animate

This method causes an animation sequence to play.

## Syntax
* void **Animate**(int sequence = 0, float speed = 1.0f, int blendtime = 250, AnimationMode mode = ANIMATION_LOOP, int frame = 0, int track = 0)
* void **Animate**(string sequence, float speed = 1.0f, int blendtime = 250, AnimationMode mode = ANIMATION_LOOP, int frame = 0, int track = 0)

| Parameter | Description |
| ------ | ------ |
| sequence | animation sequence index or name. Sequence names are not case-sensitive |
| blendtime | animation transition time, in milliseconds |
| mode | animation playback mode. This can be ANIMATION_LOOP, ANIMATION_ONCE, or ANIMATION_STOP |
| frame | starting animation frame to use |
| track | animation track, for playing multiple animations at once |

## Example

This example loads and displays an animated model.

![example](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/model_animate.jpg)

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main()
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.Move(0, 2, -8);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);
        light.SetArea(20, 20);

        //Create ground
        var ground = Box.Create(world, 10, 1, 10);
        ground.SetColor(0, 1, 0);
        ground.SetPosition(0, -0.5, 0);

        //Load FreeImage plugin
        var plugin = Plugin.Load("Plugins/FITextureLoader");

        //Load a model
        var model = Model.Load(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb");
        model.SetScale(0.05);
        model.SetRotation(0, -90, 0);
        model.Animate("1");

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```