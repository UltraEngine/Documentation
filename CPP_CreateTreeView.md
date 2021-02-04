# CreateTreeView #

The treeview widget displays a hierarchy of nodes that can be selected, opened and closed, double-clicked, and moved.

## Syntax ##

- shared_ptr<[Widget](Widget.md)\> **CreateTreeView**(const int x, const int y, const int width, const int height, shared_ptr<[Widget](Widget.md)\> parent, const TreeViewStyle style = TREEVIEW_DEFAULT)

| Parameter | Description |
| --- | --- |
| x | widget X position |
| y | widget Y position |
| width | widget width |
| height | widget height |
| parent | parent widget |
| style | treeview style, can be any combination of TREEVIEW_MULTISELECT, TREEVIEW_DRAGANDDROP, TREEVIEW_SORT, and TREEVIEW_DRAGINSERT |

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
    auto treeview = CreateTreeView(20, 20, 300, 260, panel);
    
    auto node = treeview->root->AddNode("Node 1");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");
    
    node = treeview->root->AddNode("Node 2");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");
    
    node = treeview->root->AddNode("Node 3");
    node->AddNode("Subnode 1");
    node->AddNode("Subnode 2");
    node->AddNode("Subnode 3");

    while (window->Closed() == false)
    {
        box->Turn(0, 1, 0);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
