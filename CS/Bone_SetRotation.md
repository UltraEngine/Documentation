# Bone.SetRotation

This method can be used to manually rotate a bone. You can control skinned models entirely in code or apply your own movements on top of animation.

## Syntax

- void **SetRotation**(float pitch, float yaw, float roll, bool global = false)
- void **SetRotation**([Vec3](Vec3.md) rotation, bool global = false)
- void **SetRotation**([Quat](Quat.md) rotation, bool global = false)

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | rotation to set |
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World.Update](World_Update.md) and before [World.Render](World_Render.md).

## Example

This example will load and display an animated model, but we will add code to turn the character's head back and forth as they walk.

![Bone SetRotation](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/bone_setrotation.jpg)

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main()
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyle.Center | WindowStyle.Titlebar);

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a world
        var world = new World();

        //Create a camera
        var camera = new Camera(world);
        camera.SetClearColor(0.125);
        camera.SetFOV(70);
        camera.Move(0, 2, -8);

        //Create light
        var light = new BoxLight(world);
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
        var rotation = new Vec3();

        //Main loop
        while (!window.Closed())
        {
            world.Update();

            rotation.y = Math.Cos((float)Time.Millisecs() / 10.0f) * 65.0f;
            neck.SetRotation(rotation);

            world.Render(framebuffer);
        }
    }
}
```
