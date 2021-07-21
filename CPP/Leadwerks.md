# Using a 3D Engine

It is possible to integrate Ultra App Kit into an existing 3D engine if the engine can create a 3D rendering context on a system window handle.

In this example we will describe how [Leadwerks Game Engine](https://www.leadwerks.com) can use Ultra App Kit to embed a 3D graphics viewport in a GUI application.

You can download a working project [here](https://www.ultraengine.com/community/files/file/288-leadwerks-ultra-app-kit-project/) or follow the instructions below to create a new project.

## Setting up the Project

Create a new blank project with the Professional Edition of Leadwerks Game Engine, and open it with Visual Studio.

Add this header search paths, for both debug and release build configurations:

```txt
C:\Program Files\Ultra App Kit\Include
```

If you are using Ultra App Kit on Steam, the default include path will be as follows:

```txt
C:\Program Files (x86)\Steam\steamapps\common\Ultra App Kit\Include
```

Open the App.h file and replace the code with this:

```c++
#pragma once

#include "Leadwerks.h"

#undef GetFileType

using namespace Leadwerks;

class App
{
public:
	Leadwerks::Window* window;
	Context* context;
	World* world;
	Camera* camera;

	App();
	virtual ~App();

    bool Start();
    bool Loop();
};

#undef GMF_FLOAT
#undef GMF_DOUBLE
#undef COPY_INSTANCE
#undef COPY_DUPLICATE
#undef CLEAR_COLOR
#undef CLEAR_DEPTH
#undef LUA_VERSION
#undef STREAM_READ
#undef STREAM_WRITE
#undef dFloat
#undef MAX_TERRAIN_LAYERS

//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
#ifdef _DEBUG
#pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Library\\Windows\\x86\\Debug\\AppKit.lib")
#else
#pragma comment (lib, "C:\\Program Files\\Ultra App Kit\\Library\\Windows\\x86\\Release\\AppKit.lib")
#endif  
#endif
```

If you are using Ultra App Kit on Steam, add this text instead:

```c++
#pragma once

#include "Leadwerks.h"

#undef GetFileType

using namespace Leadwerks;

class App
{
public:
	Leadwerks::Window* window;
	Context* context;
	World* world;
	Camera* camera;

	App();
	virtual ~App();

    bool Start();
    bool Loop();
};

#undef GMF_FLOAT
#undef GMF_DOUBLE
#undef COPY_INSTANCE
#undef COPY_DUPLICATE
#undef CLEAR_COLOR
#undef CLEAR_DEPTH
#undef LUA_VERSION
#undef STREAM_READ
#undef STREAM_WRITE
#undef dFloat
#undef MAX_TERRAIN_LAYERS

//Include header file
#define _ULTRA_APPKIT
#include "C:\\Program Files (x86)\\Steam\\\steamapps\\common\\Ultra App Kit\\Include\\UltraEngine.h"

//Compile library into project
#ifdef _WIN32
#ifdef _DEBUG
#pragma comment (lib, "C:\\Program Files (x86)\\Steam\\\steamapps\\common\\Ultra App Kit\\Library\\Windows\\x86\\Debug\\AppKit.lib")
#else
#pragma comment (lib, "C:\\Program Files (x86)\\Steam\\\steamapps\\common\\Ultra App Kit\\Library\\Windows\\x86\\Release\\AppKit.lib")
#endif  
#endif
```

At this point you should be able to compile the project without errors, in debug or release mode.

## Basic Example

The following program will create a window with Ultra App Kit and then retrieve the window handle to create a Leadwerks custom window and a 3D rendering context:

```c++
#include "App.h"

using namespace Leadwerks;

int main(int argc,const char *argv[])
{
    //Ultra App Kit window
    auto displays = UltraEngine::GetDisplays();
    auto mainwindow = UltraEngine::CreateWindow("Leadwerks", 0, 0, 1024, 768, displays[0]);

    //Leadwerks custom window
    Window* window = Window::Create(mainwindow->GetHandle());
    Context* context = Context::Create(window);
    
    World* world = World::Create();
    
    Camera* camera = Camera::Create();
    camera->Move(0, 0, -3);

    Light* light = DirectionalLight::Create();
    light->SetRotation(35, 45, 0);

    //Create a model
    auto model = Model::Box();
    model->SetColor(0.0, 0.0, 1.0);
    
    while (true)
    {
        if (mainwindow->Closed() or mainwindow->KeyDown(UltraEngine::KEY_ESCAPE)) break;

        model->Turn(0, Time::GetSpeed() * 0.5, 0);
        
        Time::Update();
        world->Update();
        world->Render();
        context->Sync();
    }
    return 0;
}
```

## Advanced Example

This example demonstrates a 3D rendering viewport embedded in a GUI application.

```c++
#include "App.h"

using namespace Leadwerks;

Context* context = NULL;
World* world = NULL;

int main(int argc,const char *argv[])
{
    // Get the available displays
    auto displays = UltraEngine::GetDisplays();

    // Create a window
    auto mainwindow = CreateWindow("Leadwerks", 0, 0, 800, 600, displays[0], UltraEngine::WINDOW_TITLEBAR | UltraEngine::WINDOW_RESIZABLE);

    // Create user interface
    auto ui = UltraEngine::CreateInterface(mainwindow);

    // Get the size of the user-interface
    UltraEngine::iVec2 sz = ui->root->ClientSize();

    // Create a treeview widget
    auto treeview = UltraEngine::CreateTreeView(8, 8, 200 - 16, sz.y - 16, ui->root);

    // Anchor left, top and bottom of treeview widget
    treeview->SetLayout(1, 0, 1, 1);

    // Add nodes to the treeview widget
    treeview->root->AddNode("Object 1");
    treeview->root->AddNode("Object 2");
    treeview->root->AddNode("Object 3");

    // Create a viewport window
    auto viewport = CreateWindow("", 200, 8, sz.x - 200 - 8, sz.y - 16, mainwindow, UltraEngine::WINDOW_CHILD);
    
    //Leadwerks custom window
    Window* window = Window::Create(viewport->GetHandle());
    context = Context::Create(window);
    
    world = World::Create();
    
    Camera* camera = Camera::Create();
    camera->Move(0, 0, -3);

    Light* light = DirectionalLight::Create();
    light->SetRotation(35, 45, 0);

    //Create a model
    auto model = Model::Box();
    model->SetColor(0.0, 0.0, 1.0);
    
    while (true)
    {
        if (mainwindow->Closed() or mainwindow->KeyDown(UltraEngine::KEY_ESCAPE)) break;

        model->Turn(0, Time::GetSpeed() * 0.5, 0);
        
        while (UltraEngine::PeekEvent())
        {
            const auto ev = UltraEngine::WaitEvent();
            switch (ev.id)
            {
            case UltraEngine::EVENT_WINDOWSIZE:
                if (ev.source == mainwindow)
                {
                    // If the window resize event is captured
                    auto window = ev.source->As<UltraEngine::Window>();

                    // Get the new size of the applications window
                    UltraEngine::iVec2 sz = mainwindow->ClientSize();

                    // Set the position and size of the viewport window
                    viewport->SetShape(200, 8, sz.x - 200 - 8, sz.y - 16);
                }
                break;
            }
        }

        Time::Update();
        world->Update();
        world->Render();
        context->Sync();
    }
    return 0;
}
```
When you run the program it will appear like this:

![](https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/Leadwerks.jpg)
