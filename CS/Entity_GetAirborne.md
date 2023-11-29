# Entity.GetAirborne

This method returns the current airborne state of an entity using player physics.

## Syntax

- bool **GetAirborne**()

## Returns

Returns false if the player is standing on the ground, otherwise true is returned.

## Example

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.Center | WindowFlag.Titlebar);

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a world
        var world = new World();
        world.SetGravity(0, -30, 0);

        //Create light
        var light = new DirectionalLight(world);
        light.SetRotation(35, 35, 0);
        light.SetColor(new Vec3(3));

        //Create the player
        var player = new Pivot(world);
        player.SetPhysicsMode(PhysicsMode.Player);
        player.SetMass(10);
        player.SetCollisionType(CollisionType.Player);
        player.SetPosition(0, 10, 0);

        //Create a camera    
        var camera = new Camera(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 1, -8);
        camera.SetFov(70);
        camera.SetPosition(0, 1.6, 0);
        camera.SetPosition(player.position + new Vec3(0, 1.7, 0));

        //Create the scene
        var remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";
        var scene = World.LoadMap(world, remotepath + "Maps/playertest.ultra");
        world.SetAmbientLight(0.42, 0.42, 0.5);

        //For testing player weight on objects...
        Entity box;
        box = new Box(world, 4, 0.1, 1);
        box.SetPosition(1.75, 5, 2);
        box.SetMass(1);
        box.SetSweptCollision(true);

        var camrotation = camera.GetRotation();
        var mouseaxis = window.GetMouseAxis().xy();
        const float lookspeed = 200;
        const float movespeed = 3.5f;
        const float maxaccel = 40;
        const float maxdecel = 15;
        const float mousesmoothing = 3;
        const float runspeed = 2;
        const float jumpstrength = 12;
        const float lunge = 1.5f;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.Escape))
        {
            if (Window.ActiveWindow() == window)
            {
                //Camera look
                var newaxis = window.GetMouseAxis().xy();
                var mousedelta = newaxis - mouseaxis;
                mouseaxis = newaxis;
                camrotation.x = MathUtils.Mix(camrotation.x + mousedelta.y * lookspeed, camrotation.x, 1.0f / mousesmoothing);
                camrotation.x = MathUtils.Clamp(camrotation.x, -90.0f, 90.0f);
                camrotation.y = MathUtils.Mix(camrotation.y + mousedelta.x * lookspeed, camrotation.y, 1.0f / mousesmoothing);
                camera.SetRotation(camrotation, true);

                //Movement 
                float accel = maxaccel;
                Vec2 movement;
                movement.y = (window.KeyDown(KeyCode.W) ? 1 : 0) - (window.KeyDown(KeyCode.S) ? 1 : 0);
                movement.x = (window.KeyDown(KeyCode.D) ? 1 : 0) - (window.KeyDown(KeyCode.A) ? 1 : 0);
                if (movement.x != 0.0f && movement.y != 0.0f)
                {
                    //Adjust speed on each axis if both are in use
                    movement *= 0.7071f;
                }
                movement *= movespeed;
                float jump = (window.KeyHit(KeyCode.Space) ? 1 : 0) * jumpstrength;
                bool crouch = window.KeyDown(KeyCode.C);
                if (player.GetAirborne()) jump = 0;
                if (!crouch && window.KeyDown(KeyCode.LeftShift) && !player.GetAirborne())
                {
                    movement *= runspeed;
                }
                if (jump > 0 && !crouch)
                {
                    movement *= lunge;
                    accel *= 100;
                }

                //Set input
                player.SetInput(camrotation.y, movement.y, movement.x, jump, crouch, accel, maxdecel);
            }

            world.Update();

            //Adjust camera position
            float eyeheight = 1.7f;
            if (player.GetPlayerCrouched())
            {
                eyeheight = 1.8f * 0.5f - 0.1f;
            }
            camera.SetPosition(MathUtils.Mix(camera.position.x, player.position.x, 0.5f), MathUtils.MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1f), MathUtils.Mix(camera.position.z, player.position.z, 0.5f));
            camera.SetPosition(player.position.x, MathUtils.MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1f), camera.position.z);

            world.Render(framebuffer);
        }
    }
}
```