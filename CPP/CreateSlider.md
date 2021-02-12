# CreateSlider #

The button widget can be used to create push buttons, checkboxes, radio buttons, and toolbar items. Buttons emit a WIDGETACTION event when pushed. Some styles use the widget state to indicate whether they are selected. The default slider style is a horizontal scrollbar.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateSlider**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const SliderStyle style = SLIDER_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | slider style, can be any combination of SLIDER_SCROLLBAR, SLIDER_STEPPER, SLIDER_TRACKBAR, SLIDER_HORIZONTAL, and SLIDER_VERTICAL |

## Returns ##

Returns a new slider widget.

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
    auto sz = panel->ClientSize();
    auto slider1 = CreateSlider(10, 10, 200, 30, panel, SLIDER_SCROLLBAR);
    auto slider2 = CreateSlider(10, 10 + 50, 200, 30, panel, SLIDER_TRACKBAR);

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```