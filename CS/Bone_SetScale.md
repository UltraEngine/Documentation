# Bone.SetScale

This method can be used to manually scale a bone. You can control skinned models entirely in code or apply your own movements on top of animation.

## Syntax

- void **SetScale**(float scale)

| Parameter | Description |
|---|---|
| scale | uniform scale to set |

## Remarks

To combine programmatic movement with animation, this method should be called after [World.Update](https://github.com/UltraEngine/Documentation/blob/master/Documentation/World_Update.md) and before [World.Render](https://github.com/UltraEngine/Documentation/blob/master/Documentation/World_Render.md).

## Example

This example will load and display an animated model, but we will add code to give the character a supersized noggin.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/bone_setscale.jpg)

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
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetFOV(70);
        camera.Move(0, 2, -8);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);

        //Load FreeImage plugin
        var plugin = Plugin.Load("Plugins/FITextureLoader");

        //Model by PixelMannen
        //https://opengameart.org/content/fox-and-shiba
        var model = Model.Load(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb");
        model.SetScale(0.05f);
        model.Animate(1);
        model.SetRotation(0, -90, 0);

        var neck = model.Skeleton.FindBone("b_Neck_04");
        var rotation = new Vec3();

        //Main loop
        while (!window.Closed())
        {
            world.Update();

            rotation.y = (float)Math.Cos(Millisecs() / 10.0f) * 65.0f;
            neck.SetRotation(rotation);
            neck.SetScale(2);

            world.Render(framebuffer);
        }
    }
}
```