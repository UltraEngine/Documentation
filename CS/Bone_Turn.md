# Bone.Turn

This method smoothly adds rotation to the current rotation.

## Syntax

- void **Turn**(float pitch, float yaw, float roll)
- void **Turn**(Vec3 rotation)

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | rotation to apply |
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World.Update](World_Update.md) and before [World.Render](World_Render.md).

## Example

This example will load and display an animated model, but we will add code to turn the character's head back and forth as they walk.

![bone_setrotation](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/bone_setrotation.jpg)

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
        model.SetScale(0.05);
        model.Animate(1);
        model.SetRotation(0, -90, 0);

        var neck = model.Skeleton.FindBone("b_Neck_04");
        Vec3 rotation = new Vec3();

        //Main loop
        while (!window.Closed)
        {
            world.Update();

            rotation.y = Math.Cos(Millisecs() / 10.0f) * 65.0f;
            neck.Turn(rotation, true);

            world.Render(framebuffer);
        }
    }
}
```