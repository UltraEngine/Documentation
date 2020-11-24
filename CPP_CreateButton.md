# CreateButton #

This function creates a button widget.

## Syntax ##
- shared_ptr<Widget\> **CreateButton**(const WString& text, const int x, const int y, const int width, const int height, shared_ptr<Widget\> parent, ButtonStyle = BUTTON_DEFAULT)
- shared_ptr<Widget\> **CreateButton**(const WString& text, const int x, const int y, const int width, const int height, shared_ptr<Interface\> interface, ButtonStyle = BUTTON_DEFAULT)

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Load plugins
    auto plugin_svg = LoadPlugin("Plugins/SVG.*");

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
    auto ui = CreateInterface(canvas, framebuffer);
    
    //Create widget
    auto sz = framebuffer->GetSize();
    auto panel = CreatePanel(50, 50, 400, 300, ui);

    //Create buttons
    int y = 20;
    int sep = 36;
    auto button = CreateButton("Button", 20, y, 120, 30, panel);
    y += sep;
    auto toggle = CreateButton("Toggle", 20, y, 120, 30, panel, BUTTON_TOGGLE);
    y += sep;
    auto checkbox = CreateButton("Checkbox", 20, y, 120, 30, panel, BUTTON_CHECKBOX);
    y += sep;
    auto radio1 = CreateButton("Option 1", 20, y, 120, 30, panel, BUTTON_RADIO);
    y += sep;
    auto radio2 = CreateButton("Option 2", 20, y, 120, 30, panel, BUTTON_RADIO);

    panel->SetPixmap(LoadPixmap("Materials/77684-blocks18c_1.dds"));

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
