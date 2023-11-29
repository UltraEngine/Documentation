# Model.SetSkeleton

This method assigns a skeleton to a model. You can use this to share a skeleton across multiple models.

## Syntax

- void **SetSkeleton**(shared_ptr<[Skeleton](Skeleton.md)\> skeleton)

| Parameter | Description |
|---|---|
| skeleton | skeleton to set |

## Remarks

This method can be used to efficiently animate large crowds of characters. For example, if you have a horde of 1000 zombies, and 600 of them were running towards the player, you could set all 600 of those to use just a few skeletons that were playing the run animation. This would greatly reduce the number of skeletons that require animation updates while still providing some variation between different characters.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create world
        var world = World.Create();

        //Create camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetFOV(70);
        camera.SetRotation(0, 165, 0);
        camera.Turn(15, 0, 0);
        camera.Move(0, 1, -8);

        //Create light
        var light = BoxLight.Create(world);
        light.SetRotation(45, 35, 0);
        light.SetRange(-10, 10);

        //Load FreeImage plugin
        var plugin = Plugin.Load("Plugins/FITextureLoader");

        //Load a model
        var model = Model.Load(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb");
        model.SetScale(0.05);
        model.SetPosition(-1.5, 0, 0);
        model.Animate(1);

        //Create an instance of the model
        var model2 = model.Instantiate(world) as Model;// copy and cast to the Model class
        model2.SetPosition(1.5, 0, 0);

        //Two foxes one skeleton
        model2.SetSkeleton(model.skeleton);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Keys.KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```