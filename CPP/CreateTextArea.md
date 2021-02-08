# CreateTextArea #

The text area widget is a read-only multiline text display. If the WORDWRAP style is used the text will be adjusted to fit in the horizontal space of the widget.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateTextArea**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TextField style = TEXTAREA_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | textfield style, can be TEXTAREA_DEFAULT or TEXTAREA_WORDWRAP |

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
    auto textarea = CreateTextArea(10, 10, sz.x - 20, sz.y - 20, panel, TEXTAREA_WORDWRAP);

    WString s = L"Night was falling now, and as I recalled what Akeley had written me about those earlier nights \
I shuddered to think there would be no moon. Nor did I like the way the farmhouse nestled in the lee of that\
colossal forested slope leading up to the Dark Mountain’s unvisited crest. With Akeley’s permission I lighted a small oil lamp,\
 turned it low, and set it on a distant bookcase beside the ghostly bust of Milton; but afterward I was sorry I had done so, for \
it made my host’s strained, immobile face and listless hands look damnably abnormal and corpselike. He seemed half-incapable of motion, \
though I saw him nod stiffly once in a while.";

    textarea->SetText(s);

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
