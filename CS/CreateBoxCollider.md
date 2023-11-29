# CreateBoxCollider

This function creates a collider box shape for physics interactions.

## Syntax

- **Collider** **CreateBoxCollider**(float width, float height, float depth, float x = 0, float y = 0, float z = 0, float pitch = 0, float yaw = 0, float roll = 0)

- **Collider** **CreateBoxCollider**(Vec3 size, Vec3 offset = 0, Vec3 rotation = 0)

## Parameters

| Name | Description |
|---|----|
|width|width of box|
|height|height of box|
|depth|depth of box|
|x|x component of box offset|
|y|y component of box offset|
|z|z component of box offset|
|pitch|pitch of box rotation|
|yaw|yaw of box rotation|
|roll|roll of box rotation|
|size|size of box|
|offset|offset of box|
|rotation|rotation of box|

## Returns

Returns a new collider object.

## Example

```csharp
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
        ground.SetColor(0, 1, 0);

        //Load model
        var model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Containers/crate01.glb");
        model.SetPosition(0, 5, 0);
        model.SetRotation(0, 0, 15);
        model.SetMass(1);

        //Create collider
        var bounds = model.GetBounds(BOUNDS_LOCAL);
        var collider = CreateBoxCollider(bounds.size, bounds.center);
        model.SetCollider(collider);

        while (window.Closed() == false)
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```