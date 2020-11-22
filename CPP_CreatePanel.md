# CreatePanel #
This function creates a Panel widget. The Panel widget is a rectangular area for framing child widgets.

## Syntax ##
- shared_ptr<Panel\> **CreatePanel**(const int x, const int y, const int width, const int height, shared_ptr<Interface\> parent, const PanelStyle style = PANEL_DEFAULT)
- shared_ptr<Panel\> **CreatePanel**(const int x, const int y, const int width, const int height, shared_ptr<Widget\> parent, const PanelStyle style = PANEL_DEFAULT)

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, 0, -2);
    camera->SetFOV(70);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create model
    auto box = CreateBox(world);
    box->SetColor(0.5);

    //Create a canvas
    auto canvas = CreateCanvas(world);
    camera->AddCanvas(canvas);

    //Create User Interface
    auto ui = CreateInterface(canvas,framebuffer);
    auto sz = framebuffer->GetSize();

    //Create widget
    auto panel = CreatePanel(50,50,300, framebuffer->GetSize().y - 100, ui);

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
