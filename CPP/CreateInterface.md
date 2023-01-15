# CreateInterface

This function creates a new graphical user interface for desktop applications or in-game interfaces.

## Syntax

- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[Window](Window.md)\> window)
- shared_ptr<[Interface](Interface.md)\> **CreateInterface**(shared_ptr<[World](World.md)\> world, shared_ptr<[Font](Font.md)\> font, [iVec2](iVec2.md)\> size)

| Parameter | Description |
| --- | --- |
| window | window to create the user interface on |
| world | world to create the interface in, for 3D graphics |
| font | font to use, for 3D graphics |
| size | interface dimensions, for 3D graphics |

## Returns

Returns a new interface object.

## Example

Three examples are shown below to demonstrate different types of programs you can create.

The first example shows how to create an interface directly on a window for an event-based desktop application.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create user interface
    auto ui = CreateInterface(window);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    while (true)
    {
        const Event ev = WaitEvent();
        switch (ev.id)
        {
        case EVENT_WINDOWCLOSE:
            if (ev.source == window)
            {
                return 0;
            }
            break;
        }
    }
    return 0;
}
```

The second example shows how to create an interface that appears in a 3D rendering viewport. Note that in this example you must send events to the interface with the [ProcessEvent](Interface_ProcessEvent.md) method.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0]);

    //Create framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create world
    auto world = CreateWorld();

    //Load a font
    auto font = LoadFont("Fonts/arial.ttf");

    //Create user interface
    auto ui = CreateInterface(world, font, framebuffer->size);

    //Create widget
    iVec2 sz = ui->root->ClientSize();
    auto button = CreateButton("Button", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui->root);

    //Create camera
    auto camera = CreateCamera(world, PROJECTION_ORTHOGRAPHIC);
    camera->SetPosition(float(framebuffer->size.x) * 0.5f, float(framebuffer->size.y) * 0.5f, 0);

    while (true)
    {
        while (PeekEvent())
        {
            const Event ev = WaitEvent();
            switch (ev.id)
            {
            case EVENT_WINDOWCLOSE:
                if (ev.source == window)
                {
                    return 0;
                }
                break;
            default:
                ui->ProcessEvent(ev);
                break;
            }
        }

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```

The third example shows how to create an event-driven desktop application with a 3D viewport embedded in the interface.

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

const int SidePanelWidth = 200;
const int Indent = 8;

// Callback function for resizing the viewport
bool ResizeViewport(const Event& ev, shared_ptr<Object> extra)
{
    // If the window resize event is captured
    auto window = ev.source->As<Window>();

    // Get the new size of the applications window
    iVec2 sz = window->ClientSize();

    auto viewport = extra->As<Window>();

    // Set the position and size of the viewport window
    viewport->SetShape(SidePanelWidth, Indent, sz.x - SidePanelWidth - Indent, sz.y - Indent * 2);
    
    return true;
}

//Custom event ID
const EventId EVENT_VIEWPORTRENDER = EventId(101);

int main(int argc, const char* argv[])
{
    // Disable asynchronous rendering so window resizing will work with 3D graphics
    AsyncRender(false);

    // Get the available displays
    auto displays = GetDisplays();

    // Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR | WINDOW_RESIZABLE);

    // Create user interface
    auto ui = CreateInterface(window);

    // Get the size of the user-interface
    iVec2 sz = ui->background->ClientSize();

    // Create a treeview widget
    auto treeview = CreateTreeView(Indent, Indent, SidePanelWidth - Indent * 2, sz.y - Indent * 2, ui->root);

    // Anchor left, top and bottom of treeview widget
    treeview->SetLayout(1, 0, 1, 1);

    // Add nodes to the treeview widget
    treeview->root->AddNode("Object 1");
    treeview->root->AddNode("Object 2");
    treeview->root->AddNode("Object 3");

    // Create a viewport window
    auto viewport = CreateWindow("", SidePanelWidth, Indent, sz.x - SidePanelWidth - Indent, sz.y - Indent * 2, window, WINDOW_CHILD);

    // Adjust the size of the viewport when the applications window is resized (this will callback to our ResizeViewport() function)
    ListenEvent(EVENT_WINDOWSIZE, window, ResizeViewport, viewport);

    // Create a framebuffer
    auto framebuffer = CreateFramebuffer(viewport);

    // Create a world
    auto world = CreateWorld();

    // Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -4);

    // Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(35, 45, 0);
    light->SetRange(-10, 10);

    // Create a model
    auto model = CreateSphere(world);
    model->SetColor(0, 0, 1);

    bool dirty = false;

    // Main loop
    while (true)
    {
        // Wait for event
        const Event ev = WaitEvent();

        // Evaluate event
        switch (ev.id)
        {

        //Close window when escape key is pressed
        case EVENT_KEYDOWN:
            if (ev.source == window and ev.data == KEY_ESCAPE) return 0;
            break;

        case EVENT_WINDOWCLOSE:
            if (ev.source == window) return 0;
            break;

        case EVENT_WINDOWPAINT:
            if (ev.source == viewport)
            {
                Print("Window paint");
                if (not dirty)
                {
                    // This prevents excessive paint events from building up, especially during window resizing
                    // This event is added to the end of the event queue, so if a lot of paint events build up, it will 
                    // only cause a single render to be performed.
                    dirty = true;
                    EmitEvent(EVENT_VIEWPORTRENDER, viewport);
                    Print("viewport refresh");
                }
            }
            break;

        case EVENT_VIEWPORTRENDER:
            world->Render(framebuffer);
            dirty = false;
            Print("Viewport render");
            break;
        }
    }
    return 0;
}
```
