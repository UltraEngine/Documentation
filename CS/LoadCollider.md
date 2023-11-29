# LoadCollider

This function loads a collision shape from a JSON file. Collision objects can be saved to a file by calling the [Save](Asset_Save.md) method.

## Syntax

- `Collider` **LoadCollider**(string path, [LoadFlags](LoadFlags.md) flags = LOAD_DEFAULT)

|Parameter|Description|
|---|---|
|path|file path to open|
|flags|optional load settings|

## Returns

Returns the loaded collider object if it was successfully loaded, otherwise NULL is returned.

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
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = CreateWorld();

        //Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.Move(0, 1, -3);
        camera.SetFOV(70);

        //Create light
        var light = CreateDirectionalLight(world);
        light.SetRotation(45, 35, 0);

        //Create ground
        var ground = CreateBox(world, 10, 1, 10);
        ground.SetPosition(0, -0.5, 0);

        //Load model
        var model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.glb");
        model.SetPosition(0, 3, 0);
        model.SetRotation(0, 0, 15);
        model.SetMass(1);

        //Load collision
        var collision = LoadCollider("https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.phy");
        model.SetCollider(collision);

        while (!window.Closed())
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```