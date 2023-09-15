# Entity::GetAirborne

This method returns the current airborne state of an entity using player physics.

## Syntax

bool **GetAirborne**()

## Returns

Returns false if the player is standing on the ground, otherwise true is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();
    world->SetAmbientLight(0.42, 0.42, 0.5);
    world->SetGravity(0, -30, 0);

    //Set environment
    WString remotepath = "https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/";
    world->SetEnvironmentMap(LoadTexture(remotepath + "Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_BACKGROUND);
    world->SetEnvironmentMap(LoadTexture(remotepath + "Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(LoadTexture(remotepath + "Materials/Environment/Storm/diffuse.dds"), ENVIRONMENTMAP_DIFFUSE);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    //Create the player
    auto player = CreatePivot(world);
    player->SetPhysicsMode(PHYSICS_PLAYER);
    player->SetMass(10);
    player->SetCollisionType(COLLISION_PLAYER);
    player->SetPosition(0, 10, 0);

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 1, -8);
    camera->SetFov(70);
    camera->SetPosition(0, 1.6, 0);
    camera->AddPostEffect(LoadPostEffect("Shaders/SSAO.fx"));
    camera->AddPostEffect(LoadPostEffect("Shaders/FXAA.fx"));
    camera->AddPostEffect(LoadPostEffect("Shaders/Bloom.fx"));
    camera->SetPosition(player->position + Vec3(0, 1.7, 0));

    //Create the scene
    auto mtl = CreateMaterial();
    mtl->SetTexture(LoadTexture(remotepath + "Materials/Developer/graygrid.dds"));
    auto scene = LoadMap(world, remotepath + "Maps/playertest.map");
    for (auto entity : scene->entities)
    {
        entity->SetMaterial(mtl, true);
    }

    //For testing player weight on objects...
    shared_ptr<Entity> box;
    box = CreateBox(world, 4, 0.1, 1);
    box->SetPosition(1.75, 5, 2);
    box->SetMass(1);
    box->SetSweptCollision(true);

    Vec3 camrotation = camera->GetRotation();
    Vec2 mouseaxis = window->GetMouseAxis().xy();
    const float lookspeed = 200;
    const float movespeed = 3.5;
    const float maxaccel = 40;
    const float maxdecel = 15;
    const float mousesmoothing = 3;
    const float runspeed = 2;
    const float jumpstrength = 12;
    const float lunge = 1.5;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (ActiveWindow() == window)
        {
            //Camera look
            Vec2 newaxis = window->GetMouseAxis().xy();
            Vec2 mousedelta = newaxis - mouseaxis;
            mouseaxis = newaxis;
            camrotation.x = Mix(camrotation.x + mousedelta.y * lookspeed, camrotation.x, 1.0f / mousesmoothing);
            camrotation.x = Clamp(camrotation.x, -90.0f, 90.0f);
            camrotation.y = Mix(camrotation.y + mousedelta.x * lookspeed, camrotation.y, 1.0f / mousesmoothing);
            camera->SetRotation(camrotation, true);

            //Movement 
            float accel = maxaccel;
            Vec2 movement;
            movement.y = (window->KeyDown(KEY_W) - window->KeyDown(KEY_S));
            movement.x = (window->KeyDown(KEY_D) - window->KeyDown(KEY_A));
            if (movement.x != 0.0f and movement.y != 0.0f)
            {
                //Adjust speed on each axis if both are in use
                movement *= 0.7071f;
            }
            movement *= movespeed;
            float jump = window->KeyHit(KEY_SPACE) * jumpstrength;
            bool crouch = window->KeyDown(KEY_C);
            if (player->GetAirborne()) jump = 0;
            if (crouch == false and window->KeyDown(KEY_SHIFT) and !player->GetAirborne())
            {
                movement *= runspeed;
            }
            if (jump > 0 and crouch == false)
            {
                movement *= lunge;
                accel *= 100;
            }

            //Set input
            player->SetInput(camrotation.y, movement.y, movement.x, jump, crouch, accel, maxdecel);
        }

        world->Update();

        //Adjust camera position
        float eyeheight = 1.7f;
        if (player->GetCrouched())
        {
            eyeheight = 1.8f * 0.5f - 0.1f;
        }
        camera->SetPosition(Mix(camera->position.x, player->position.x, 0.5f), MoveTowards(camera->position.y, player->position.y + eyeheight, 0.1f), Mix(camera->position.z, player->position.z, 0.5f));
        camera->SetPosition(player->position.x, MoveTowards(camera->position.y, player->position.y + eyeheight, 0.1f), camera->position.z);

        world->Render(framebuffer);
    }
    return 0;
}
```
