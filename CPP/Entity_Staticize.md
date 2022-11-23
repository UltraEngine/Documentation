# Entity::Staticize

This method makes the entity static. A static entity cannot move and can be much more efficient for rendering, pathfinding, and physics, to make your application run even faster. This operation is one-way and cannot be reversed.

## Syntax

- void **Staticize**()

## Example

In this example the scene is optimized to make non-moving objects static, resulting in a lower shadow polygon count. In large scenes with many lights this can result in a large reduction of rendered polygons and faster performance.

![](https://github.com/Leadwerks/Documentation/raw/master/Images/Entity_MakeStatic.gif)

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get display
    auto displays = GetDisplays();
    auto display = displays[0];

    //Create window
    auto window = CreateWindow(display, "", 0, 0, 1280 * display->scale.x, 720 * display->scale.y);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();
    world->SetAmbientLight(0.1);
    world->RecordStats(true);

    //Create camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.25);
    camera->SetPosition(0, 2, 0);
    camera->Move(0, 0, -5);

    //Build scene
    auto tunnel = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/tunnel_t.glb");
    tunnel->SetRotation(0, 180, 0);
    tunnel->MakeStatic();

    auto cage = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fancage.glb");
    cage->MakeStatic();

    auto fan = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Underground/fanblades.glb");
    fan->SetPosition(0, 2, 0);

    auto light = CreatePointLight(world);
    light->SetColor(2, 2, 2);
    light->SetRange(10);
    light->SetPosition(0, 2, 2);
    light->SetColor(4.0);

    //Display text
    auto spritelayer = CreateSpriteLayer(world);
    camera->AddSpriteLayer(spritelayer);
    auto font = LoadFont("Fonts/arial.ttf");

    auto text = CreateText(spritelayer, font, "Shadow polygons: 0", 14.0 * display->scale.y);
    text->SetPosition(2, 2);

    auto text2 = CreateText(spritelayer, font, "Press space to make the light static.", 14.0 * display->scale.y);
    text2->SetPosition(2, 20 * display->scale.y);

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

        text->SetText("Shadow polygons: " + String(world->renderstats.shadowpolygons));
    }
    return 0;
}
```
