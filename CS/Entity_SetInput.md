### Entity.SetInput

This method sets player input for an entity that has its physics mode set to PHYSICS_PLAYER.

Syntax
```csharp
void SetInput(float angle, float move, float strafe = 0, float jump = 0, bool crouch = false, float maxaccel = 40, float maxdecel = 15)
```

| Parameter | Description |
|---|---|
| angle | rotation of the character in degrees |
| move | forward or backwards movement |
| strafe | right or left movement |
| jump | jump force |
| crouch | crouch state |
| maxaccel | max acceleration |
| maxdecel | max deceleration |

Remarks:

You can set the entity physics mode with the [Entity.SetPhysicsMode](Entity_SetPhysicsMode.md) method.

You can use the [Entity.GetAirborne](Entity_GetAirborne.md) method to check if the entity is standing on the ground and able to jump.

Example
```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlag.WINDOW_CENTER | WindowFlag.WINDOW_TITLEBAR);

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a world
        var world = World.Create();
        world.SetGravity(0, -30, 0);

        //Create light
        var light = DirectionalLight.Create(world);
        light.SetRotation(35, 35, 0);
        light.SetColor(3);

        //Create the player
        var player = Pivot.Create(world);
        player.SetPhysicsMode(PhysicsMode.PHYSICS_PLAYER);
        player.SetMass(10);
        player.SetCollisionType(CollisionType.COLLISION_PLAYER);
        player.SetPosition(0, 10, 0);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetPosition(0, 1, -8);
        camera.SetFov(70);
        camera.SetPosition(0, 1.6, 0);
        camera.SetPosition(player.position + new Vec3(0, 1.7, 0));

        //Create the scene
        var remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";
        var scene = world.LoadMap(remotepath + "Maps/playertest.ultra");
        world.SetAmbientLight(0.42, 0.42, 0.5);

        //For testing player weight on objects...
        Entity box;
        box = Box.Create(world, 4, 0.1, 1);
        box.SetPosition(1.75, 5, 2);
        box.SetMass(1);
        box.SetSweptCollision(true);

        Vec3 camrotation = camera.GetRotation();
        Vec2 mouseaxis = window.GetMouseAxis().xy();
        const float lookspeed = 200;
        const float movespeed = 3.5f;
        const float maxaccel = 40;
        const float maxdecel = 15;
        const float mousesmoothing = 3;
        const float runspeed = 2;
        const float jumpstrength = 12;
        const float lunge = 1.5f;

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            if (Window.ActiveWindow() == window)
            {
                //Camera look
                Vec2 newaxis = window.GetMouseAxis().xy();
                Vec2 mousedelta = newaxis - mouseaxis;
                mouseaxis = newaxis;
                camrotation.x = Mix(camrotation.x + mousedelta.y * lookspeed, camrotation.x, 1.0f / mousesmoothing);
                camrotation.x = Clamp(camrotation.x, -90.0f, 90.0f);
                camrotation.y = Mix(camrotation.y + mousedelta.x * lookspeed, camrotation.y, 1.0f / mousesmoothing);
                camera.SetRotation(camrotation, true);

                //Movement
                float accel = maxaccel;
                Vec2 movement;
                movement.y = (window.KeyDown(Key.KEY_W) ? 1 : 0) - (window.KeyDown(Key.KEY_S) ? 1 : 0);
                movement.x = (window.KeyDown(Key.KEY_D) ? 1 : 0) - (window.KeyDown(Key.KEY_A) ? 1 : 0);
                if (movement.x != 0.0f && movement.y != 0.0f)
                {
                    //Adjust speed on each axis if both are in use
                    movement *= 0.7071f;
                }
                movement *= movespeed;
                float jump = window.KeyHit(Key.KEY_SPACE) ? jumpstrength : 0;
                bool crouch = window.KeyDown(Key.KEY_C);
                if (player.GetAirborne()) jump = 0;
                if (!crouch && window.KeyDown(Key.KEY_SHIFT) && !player.GetAirborne())
                {
                    movement *= runspeed;
                }
                if (jump > 0 && !crouch)
                {
                    movement *= lunge;
                    accel *= 100;
                }

                //Set input
                player.SetPlayerInput(camrotation.y, movement.y, movement.x, jump, crouch, accel, maxdecel);
            }

            world.Update();

            //Adjust camera position
            float eyeheight = 1.7f;
            if (player.GetCrouched())
            {
                eyeheight = 1.8f * 0.5f - 0.1f;
            }
            camera.SetPosition(Mix(camera.position.x, player.position.x, 0.5f), MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1f), Mix(camera.position.z, player.position.z, 0.5f));
            camera.SetPosition(player.position.x, MoveTowards(camera.position.y, player.position.y + eyeheight, 0.1f), camera.position.z);

            world.Render(framebuffer);
        }
    }
}
```