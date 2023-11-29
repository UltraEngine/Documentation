# CreateConeCollider

This function creates a collision cone shape for physics interactions.

## Syntax
- ```C#
  Collider CreateConeCollider(float radius, float height, float x = 0, float y = 0, float z = 0, float pitch = 0, float yaw = 0, float roll = 0)
  ```
- ```C#
  Collider CreateConeCollider(float radius, float height, xVec3 offset, xVec3 rotation = 0)
  ```

|Parameter|Description|
|---|---|
|radius|radius of shape|
|height|height of shape|
|x|x component of shape offset|
|y|y component of shape offset|
|z|z component of shape offset|
|pitch|pitch of shape rotation|
|yaw|yaw of shape rotation|
|roll|roll of shape rotation|
|offset|offset of shape|
|rotation|rotation of shape|

## Returns

Returns a new collider object.

## Example

```C#
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get displays list
        var displays = GetDisplays();

        //Create window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_TITLEBAR | WINDOW_CENTER);

        //Create framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create world
        var world = CreateWorld();

        //Create camera
        var camera = CreateCamera(world);
        camera.SetFOV(70);
        camera.Turn(15, 0, 0);
        camera.Move(0, 2, -8);
        camera.SetClearColor(0.125);

        //Create light
        var light = CreateDirectionalLight(world);
        light.SetRotation(45, 35, 0);

        //Create ground
        var ground = CreateBox(world, 10, 1, 10);
        ground.SetColor(0,1,0);
        ground.SetPosition(0, -0.5, 0);
     
        //Create model
        var model = CreateCone(world, 0.5, 2);
        model.SetPosition(0, 5, 0);
        model.SetRotation(90, 0, 0);
        model.SetColor(0, 0, 1);
        model.SetMass(1);
        model.AddForce(100, 0, 0);

        //Create collision
        var collider = CreateConeCollider(0.5, 2);
        model.SetCollider(collider);

        while (!window.Closed() && !window.KeyHit(KEY_ESCAPE))
        {
            world.Update();
            world.Render(framebuffer);
        }
    }
}
```