# Entity::Control


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
    world->SetAmbientLight(0.5);
    world->SetEnvironmentMap(LoadTexture("Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_BACKGROUND);
    world->SetEnvironmentMap(LoadTexture("Materials/Environment/Storm/specular.dds"), ENVIRONMENTMAP_SPECULAR);
    world->SetEnvironmentMap(LoadTexture("Materials/Environment/Storm/diffuse.dds"), ENVIRONMENTMAP_DIFFUSE);

    //Create light
    auto light = CreateDirectionalLight(world);
    light->SetRotation(35, 35, 0);
    light->SetColor(2);

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
    camera->SetPosition(0, 1.6, 0);
    camera->SetParent(player, false);
    camera->AddPostEffect(LoadPostEffect("Shaders/PostEffects/SSAO.json"));

    //Create the scene
    auto scene = LoadModel(world, "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Models/playertest.obj");
    scene->UpdateNormals();
    scene->BuildShape(false, true);
    scene->SetCollisionType(COLLISION_SCENE);

    Vec3 camrotation = camera->GetRotation();
    Vec2 mouseaxis = window->GetMouseAxis();
    float lookspeed = 200;
    float movespeed = 4;
    float maxaccel = 40;
    float maxdecel = 20;
    float mousesmoothing = 3;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        if (ActiveWindow() == window)
        {
            //Camera look
            Vec2 newaxis = window->GetMouseAxis();
            Vec2 movement = newaxis - mouseaxis;
            mouseaxis = newaxis;
            camrotation.x = CurveValue(camrotation.x + movement.y * lookspeed, camrotation.x, mousesmoothing);
            camrotation.x = Clamp(camrotation.x,-90.0f, 90.0f);
            camrotation.y = CurveValue(camrotation.y + movement.x * lookspeed, camrotation.y, mousesmoothing);
            camera->SetRotation(camrotation);

            //Movement controls
            float move = (window->KeyDown(KEY_W) - window->KeyDown(KEY_S)) * movespeed;
            float strafe = (window->KeyDown(KEY_D) - window->KeyDown(KEY_A)) * movespeed;
            float jump = window->KeyHit(KEY_SPACE) * 8;
             
            //Set input
            player->Control(camrotation.y, move, strafe, jump, false, maxaccel, maxdecel);
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
