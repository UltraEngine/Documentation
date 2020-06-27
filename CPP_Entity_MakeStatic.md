# Entity::MakeStatic #
This method permanently freezes an entity and makes it static. A static entity cannot move and may be more efficient for rendering, pathfinding, and physics, to make your application run even faster.

## Syntax ##
- void **MakeStatic**()

## Example ##
In this example the scene is optimized to make non-moving objects static, resulting in a lower shadow polygon count. In large scenes this can make a big improvement in performance.

```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Create window
    auto displays = ListDisplays();
    float displayscale = displays[0]->GetScale().x;
    auto window = CreateWindow(displays[0], "", 0, 0, 1280 * displayscale, 720 * displayscale);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.25);
    camera->SetPosition(0, 2, 0);
    camera->Move(0, 0, -5);

    //Build scene
    auto tunnel = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/tunnel_t.glb");
    tunnel->SetRotation(0, 180, 0);
    auto cage = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fancage.glb");
    tunnel->MakeStatic();
    cage->MakeStatic();

    //Load fan model
    auto fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fanblades.glb");
    fan->SetPosition(0, 2, 0);

    //Create spot light
    auto light = CreateLight(world, LIGHT_POINT);
    light->SetColor(2, 2, 2);
    light->SetRange(10);
    light->SetPosition(0, 2, 2);
    light->SetColor(4.0);
 
    //Display text
    auto spritelayer = CreateSpriteLayer(world);
    camera->AddSpriteLayer(spritelayer);
    auto font = LoadFont("Fonts/arial.ttf");

    auto text = CreateText(spritelayer, font, "0 shadow polygons.", 14.0 * displayscale);
    text->SetPosition(2, 2);

    auto text2 = CreateText(spritelayer, font, "Press space to optimize the scene.", 14.0 * displayscale);
    text2->SetPosition(2, 20 * displayscale);

    //Enable stats recording
    world->RecordStats(true);

    //Main loop
    while (!window->KeyHit(KEY_ESCAPE) and !window->Closed())
    {
        fan->Turn(0, 0, 5);

        world->Update();
        world->Render(framebuffer);

        if (window->KeyHit(KEY_SPACE))
        {
            light->MakeStatic();
            text2->Hide();
        }

        //Display shadow polycount
        text->SetText("Shadow polygons: " + String(world->renderstats.shadowpolygons));
    }

    return 0;
}
```
