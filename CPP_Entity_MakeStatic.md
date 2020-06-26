# Entity::MakeStatic #
This method permanently freezes an entity and makes it static. A static entity cannot move and may be more efficient for rendering, pathfinding, and physics, to make your application run even faster.

## Syntax ##
- void **MakeStatic**()

## Example ##
```c++
#include "pch.h"

int main(int argc, const char* argv[])
{
    //MULTIPASS_CUBEMAP = 0;

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
    camera->Turn(35, 0, 0);
    camera->Move(0, 0, -5);

    //Create model with lots of extra polygons
    auto ground = CreateBox(world, 10, 1, 10, 4, 4);
    auto box = CreateBox(world, 2, 1, 2);
    box->SetPosition(0,1,0);

    //Load fan model
    auto fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Fanblades/fanblades.glb");
    fan->SetRotation(90, 0, 0);
    fan->SetPosition(0, 3, 0);

    //Create spot light
    auto light = CreateLight(world, LIGHT_SPOT);
    light->SetColor(2, 2, 2);
    light->SetRange(10);
    light->SetRotation(90, 0, 0);
    light->SetPosition(0, 4, 0);
    
    //Display text
    auto spritelayer = CreateSpriteLayer(world);
    camera->AddSpriteLayer(spritelayer);
    auto font = LoadFont("Fonts/arial.ttf");

    auto text = CreateText(spritelayer, font, "0 shadow polygons.", 14.0 * displayscale);
    text->SetPosition(2, 2);

    auto text2 = CreateText(spritelayer, font, "Press space to make the ground static.", 14.0 * displayscale);
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
            text2->Hide();
            box->MakeStatic();
            ground->MakeStatic();
            light->MakeStatic();
        }

        //Display shadow polycount
        text->SetText("Shadow polygons: " + String(world->renderstats.shadowpolygons));
    }

    return 0;
}
```
