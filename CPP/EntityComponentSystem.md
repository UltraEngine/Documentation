# Entity Component System

The Ultra Engine Entity Component System is a high-level system for developing games and simulations. The component system is designed to meet the following goals:

- Allow addition of modular logical components without increasing the overall complexity of the program.
- Support for saving and loading of user-defined objects and game states.
- Facilitate emergent behavior as a result of component interaction.

The entity component system consists of internal engine elements combined with a [preprocessor](https://github.com/UltraEngine/Preprocessor) that generates code for your game. The type of components that are available will vary depending on what code files you have present in your project directory.

### Actors

In the core Ultra Engine API you are accustomed to using entities. In the entity component system, the [Actor](Actor.md) is our main object type. The actor poseesses an entity as and additional modular "blocks" of behavior called components.

### Components

[Components](Component.md) are blocks of functionality that can be added to an actor. An actor can have multiple components, but only one component of each type.

### Usage

To start using the entity component system, create an actor:

```c++
auto actor = CreateActor(entity);
```

You can add components to the actor like this:

```c++
actor->AddComponent<Mover>();
```

You can call any methods of any components, and all component methods by the same name will be called:

```c++
actor->Kill();
```

You also can call a method for just one specific component, but it is generally better to call the actor method so that all components are have this method called:

```c++
actor->GetComponent<PlayerController>()->Kill();
```

You can access members of an individual component:

```c++
actor->GetComponent<PlayerController>()->health = 99;
```

You can also call a method to set a value, and this will call the same method for each component that has it:

```c++
actor->SetHealth(99);
```

You can copy an actor. The entity will be instantiated and all components will be copied to the new actor, with their current properties intact:

```c++
auto actor2 = actor->Copy();
```

### Saving and Loading

The entity component system works together with the [Scene](Scene.md) system to save your entity components to a file and load them back into the program. This can be used for game saves or serializing the game state to send over a network to another player. In the example below, a scene is created, saved, and loaded again with C++ member values intact:

```c++
#include "UltraEngine.h"
#include "ComponentSystem.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -4);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRotation(45, 35, 0);
    light->SetRange(-10, 10);
    light->SetColor(2);

    //Streams for storing the scene
    shared_ptr<BufferStream> stream = CreateBufferStream();
    shared_ptr<BufferStream> binstream = CreateBufferStream();

    //Put this in brackets and all the variables will go out of scope at the end, and the objects will be deleted
    {
        //Create an actor
        auto box = CreateBox(world);
        box->SetColor(0, 0, 1);
        auto actor = CreateActor(box);

        //Add a component
        auto mover = actor->AddComponent<Mover>();

        //Set a member of the component
        mover->rotation.y = -45;

        //Save a scene
        auto scene = CreateScene();
        scene->AddEntity(box);
        scene->Save(stream, binstream);
        
        //Change some settings just to prove that it's working
        box->SetColor(1, 0, 0);
        mover->rotation.y = 0;
    }

    //Load the scene
    stream->Seek(0);
    binstream->Seek(0);
    auto scene = LoadScene(world, stream, binstream);

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```

### Creating New Components

To add a new component class, create a new .hpp file in "Source/Components" with the name of the class. The name of the file must match the class name and cannot contain any spaces. For example "Source/Components/MyComponent.hpp". Open the file and add this code:
```c++
#pragma once
#include "UltraEngine.h"
#include "../ComponentSystem.h"

using namespace UltraEngine;

class MyComponent : public Component
{
public: 

    virtual void Start()
    {
    
    }

    virtual void Update()
    {
    
    }
    
    virtual void Collide(std::shared_ptr<Actor> actor, const Vec3& position, const Vec3& normal, const float speed)
    {
    
    }
    
    virtual bool Save(nlohmann::json& j3)
    {
        if (!Component::Save(j3)) return false;
        return true;
    }
    
    virtual bool Load(nlohmann::json& j3)
    {
        if (!Component::Load(j3)) return false;
        return true;
    }
}; 
```

You can omit any of the above methods if you are not using them. At scale, it will make your program more efficient if you declare only the methods you actually use.
