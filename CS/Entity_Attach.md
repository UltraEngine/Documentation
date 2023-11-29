## Entity.Attach

This method attaches an entity to a model bone or a navigation agent. This provides a way of "gluing" an entity to a non-entity object.

### Syntax

- `bool Attach(shared_ptr<[Model](Model.md)> model, shared_ptr<[Bone](Bone.md)> bone)`
- `bool Attach(shared_ptr<[NavAgent](NavAgent.md)> agent)`
- `bool Attach(shared_ptr<[VrDevice](VrDevice.md)> device)`

| Parameter | Description |
| --- | --- |
| model | model to attach entity to |
| bone | skeleton bone to attach entity to |
| agent | navigation agent to attach entity to |
| device | VR device to attach entity to |

### Returns

Returns true if the attachment is valid, otherwise false is returned.

### Remarks

For bone attachments, the bone must belong to the skeleton the model is currently using.

The entity's local orientation at the time this method is called will be used to orient around the attachment.

A bone's scale will be disregarded in the entity placement.

### Example

This example will load an animated model and add some headgear to keep him warm.

![Image](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/entity_attach.jpg)

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
        var head = model.Skeleton.FindBone("b_Head_05");
        Vec3 rotation = new Vec3();

        //Model by alissvetlana
        //https://sketchfab.com/3d-models/hat-a7f54e87bea94730b4a1827ec1f770df
        var hat = Model.Load(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/hat.glb");
        hat.SetScale(0.025);
        hat.SetPosition(-0.3, 0.4, 0);
        hat.Attach(model, head);

        //Main loop
        while (!window.Closed() && !window.KeyHit(Key.KEY_ESCAPE))
        {
            world.Update();

            rotation.y = Math.Cos((float)Time.Millisecs() / 10.0f) * 65.0f;
            neck.SetRotation(rotation);

            world.Render(framebuffer);
        }
    }
}
```
