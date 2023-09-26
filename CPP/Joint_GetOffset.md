# Joint::GetOffset

This method returns the current joint offset.

## Syntax

- dFloat **GetOffset**()

## Returns

Returns the current angle of a hinge joint in degrees, or position of a slider joint in meters.

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

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -6);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    auto parent = CreateBox(world);
    parent->SetColor(0, 0, 1);

    auto child = CreateBox(world);
    child->SetPosition(4, 0, 0);
    child->SetMass(1);
    child->SetColor(0, 1, 0);
    
    //Create joint
    auto joint = CreateHingeJoint(parent->position, Vec3(0, 0, 1), parent, child);

    //Setup 2D display
    auto cam2d = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    cam2d->SetRenderLayers(128);
    cam2d->SetClearMode(CLEAR_DEPTH);
    cam2d->SetPosition(float(framebuffer->size.x) * 0.5f, float(framebuffer->size.y) * 0.5f);

    auto font = LoadFont("Fonts/arial.ttf");
    auto sprite = CreateSprite(world, font, "0", 18);
    sprite->SetRenderLayers(128);
    sprite->SetPosition(2, framebuffer->size.y - font->GetHeight(18) - 2, 0);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        sprite->SetText("Angle: " + String(joint->GetOffset()));
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
