# 2D Platformer Controls

This example demonstrates how to create a 2D platformer player and control movement and jumping.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //ASyncRender(false);

    //auto signal = make_shared<Signal>();
    //signal->Wait();

    //ASyncRender(false);

    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    auto world = CreateWorld(PHYSICSENGINE_BOX2D);
    world->SetGravity(0, -9.81 * 100, 0);

    auto framebuffer = CreateFramebuffer(window);

    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetClearColor(0.125);
    camera->SetPosition(float(framebuffer->size.x) * 0.5f, float(framebuffer->size.y) * 0.5f);
   
    auto ground = CreateSprite(world, framebuffer->size.x * 2, 50, false, 0, true);
    ground->SetColor(0, 1, 0);
    ground->SetPosition(-framebuffer->size.x / 2, 0);

    auto player = CreateSprite(world, 20, 80);
    player->SetColor(1, 0, 0);
    player->SetPosition(100, 100);
    player->SetMass(1);
    player->SetFriction(0.01);
    player->mesh->Recenter();
    player->mesh->Finalize();
    player->UpdateBounds();
    auto collider = CreateRectCollider(-10, -40, 20, 80);
    player->SetCollider(collider);
    player->SetElasticity(0);
    ground->SetElasticity(0);

    auto joint = CreateKinematicJoint(Vec3(0), player);
    joint->SetMaxTorque(10000);

    float movespeed = 20;
    float jumpforce = 20000;
    float smoothmove=0;

    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        bool onground = false;
        PickInfo pick;
        if (world->Pick(player->position, player->position - Vec3(0, 41, 0), pick, 0, true, COLLISION_PLAYER, true))
        {
            if (pick.normal.y > 0.707) onground = true;
        }

        if (onground)
        {
            float move = movespeed * (window->KeyDown(KEY_RIGHT) - window->KeyDown(KEY_LEFT)) * movespeed;
            //player->SetPosition(player->position.x+move/60.0f, player->position.y, 0);
            auto v = player->velocity;
            player->SetVelocity(0.5 * move + 0.5 * v.x, v.y);
        }

        //Print(player->GetVelocity().x);

        if (window->KeyHit(KEY_UP))
        {
            if (onground) player->SetVelocity(player->velocity.x, player->velocity.y + jumpforce);
        }

        world->Update();
        world->Render(framebuffer, true);
    }
    return 0;
}
```
