# Entity.GetCrouched

This method returns the current crouch state of an entity using player physics.

## Syntax

```csharp
bool GetCrouched();
```

## Returns

Returns true if the player input has set the crouch state to true or if the player is unable to stand up, otherwise false is returned.

## Example

```csharp
using System;
using Ultraviolet;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Ultraviolet.GetDisplays();

        //Create a window
        var window = Ultraviolet.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowOptions.Centered | WindowOptions.Resizable);

        //Create a 2D context
        var context = new UltravioletContext(window);

        //Create a world
        var world = new World();
        world.SetGravity(0, -30, 0);

        //Create light
        var light = new DirectionalLight(world);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create the player
        var player = new Pivot(world);
        player.SetPhysicsMode(PhysicsMode.Player);
        player.SetMass(10);
        player.SetCollisionType(CollisionType.Player);
        player.SetPosition(0, 10, 0);

        //Create a camera    
        var camera = new Camera(world);
        camera.SetClearColor(Color.FromRgb(0.125f));
        camera.SetPosition(0, 1, -8);
        camera.SetFov(70);
        camera.SetPosition(0, 1.6, 0);
        camera.SetPosition(player.position + new Vector3(0, 1.7, 0));

        //Create the scene
        var remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";
        var scene = world.LoadMap(remotepath + "Maps/playertest.ultra");
        world.SetAmbientLight(0.42f, 0.42f, 0.5f);

        //For testing player weight on objects...
        Entity box;
        box = new Box(world, 4, 0.1, 1);
        box.SetPosition(1.75, 5, 2);
        box.SetMass(1);
        box.SetSweptCollision(true);

        Vector3 camrotation = camera.GetRotation();
        Vector2 mouseaxis = window.GetMouseAxis().XY;
        const float lookspeed = 200;
        const float movespeed = 3.5;
        const float maxaccel = 40;
        const float maxdecel = 15;
        const float mousesmoothing = 3;
        const float runspeed = 2;
        const float jumpstrength = 12;
        const float lunge = 1.5;

        //Main loop
        while (!window.IsClosed && !window.IsKeyDown(Key.Escape))
        {
            if (Ultraviolet.Input.ActiveWindow == window)
            {
                //Camera look
                Vector2 newaxis = window.GetMouseAxis().XY;
                Vector2 mousedelta = newaxis - mouseaxis;
                mouseaxis = newaxis;
                camrotation.X = Ultraviolet.MathUtils.Mix(camrotation.X + mousedelta.Y * lookspeed, camrotation.X, 1.0f / mousesmoothing);
                camrotation.X = Ultraviolet.MathUtils.Clamp(camrotation.X, -90.0f, 90.0f);
                camrotation.Y = Ultraviolet.MathUtils.Mix(camrotation.Y + mousedelta.X * lookspeed, camrotation.Y, 1.0f / mousesmoothing);
                camera.SetRotation(camrotation, true);

                //Movement 
                float accel = maxaccel;
                Vector2 movement;
                movement.Y = (window.IsKeyDown(Key.W) ? 1 : 0) - (window.IsKeyDown(Key.S) ? 1 : 0);
                movement.X = (window.IsKeyDown(Key.D) ? 1 : 0) - (window.IsKeyDown(Key.A) ? 1 : 0);
                if (movement.X != 0.0f && movement.Y != 0.0f)
                {
                    //Adjust speed on each axis if both are in use
                    movement *= 0.7071f;
                }
                movement *= movespeed;
                float jump = (window.IsKeyHit(Key.Space) ? 1 : 0) * jumpstrength;
                bool crouch = window.IsKeyDown(Key.C);
                if (player.GetAirborne()) jump = 0;
                if (!crouch && window.IsKeyDown(Key.LeftShift) && !player.GetAirborne())
                {
                    movement *= runspeed;
                }
                if (jump > 0 && !crouch)
                {
                    movement *= lunge;
                    accel *= 100;
                }

                //Set input
                player.SetInput(camrotation.Y, movement.Y, movement.X, jump, crouch, accel, maxdecel);
            }

            world.Update();

            //Adjust camera position
            float eyeheight = 1.7f;
            if (player.GetCrouched())
            {
                eyeheight = 1.8f * 0.5f - 0.1f;
            }
            camera.SetPosition(Ultraviolet.MathUtils.Mix(camera.position.X, player.position.X, 0.5f), Ultraviolet.MathUtils.MoveTowards(camera.position.Y, player.position.Y + eyeheight, 0.1f), Ultraviolet.MathUtils.Mix(camera.position.Z, player.position.Z, 0.5f));
            camera.SetPosition(player.position.X, Ultraviolet.MathUtils.MoveTowards(camera.position.Y, player.position.Y + eyeheight, 0.1f), camera.position.Z);

            world.Render();
        }

        context?.Dispose();
    }
}
```