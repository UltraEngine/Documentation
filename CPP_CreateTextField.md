# CreateTextField #

The textfield widget is an editable input box.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateTextField**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TextField style = TEXTFIELD_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be TEXTFIELD_DEFAULT, TEXTFIELD_READONLY, TEXTFIELD_DYNAMIC, TEXTFIELD_NUMBER, or TEXTFIELD_INTEGER |

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
    auto panel = CreatePanel(50, 50, 400, 300, ui);

    //Create widget
    auto textfield = CreateTextField(20, 20, 300, 32, panel);
    textfield->SetText("Here is some text!");

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
