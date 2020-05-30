# LoadCollision #
This function loads a collision shape from a file.

## Syntax ##
- shared_ptr<[Collision](CPP_Collision.md)\> **LoadCollision**(const string& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Collision](CPP_Collision.md)\> **LoadCollision**(const wstring& path, const LoadFlags flags = LOAD_DEFAULT)
- shared_ptr<[Collision](CPP_Collision.md)\> **LoadCollision**(shared_ptr<[Stream](CPP_Stream.md)\> stream, const LoadFlags flags = LOAD_DEFAULT)

## Parameters ##
|Name|Description|
|---|---|
|path|file path to open|
|stream|open stream to read from|
|flags|optional load settings|

## Remarks ##
The PHY collision shape format is a JSON-based ASCII format. PHY files consist of one top-level *collision* object that contains an array of shapes. Each shape has a type, offset, rotation, and size attributes.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "BOX",
                "offset": [0,0,0],
                "rotation": [0,0,0],
                "size": [1,1,1]
            }
        ]
    }
}
```
Supported shapes include "BOX", "CONE", "CYLINDER", "SPHERE", "CONVEX_HULL", and "MESH". In the case of cylinders and cones, the z parameter of the size array will be ignored and can be ommitted.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CYLINDER",
                "size": [1,1]
            }
        ]
    }
}
```
In the case of spheres, a single numerical value is used. Note that in all cases, size indicates diameter, not radius.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "SPHERE",
                "size": 1
            }
        ]
    }
}
```

Shapes of type CONVEX_HULL should include an array of vertex positions that is evenly divisible by three:
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "vertices": [-0.5,0.5,0.5,0.5,0.5,0.5,0.5,-0.5,-0.5,-0.5,-0.5,0.5]
            }
        ]
    }
}
```

Shapes of type MESH should include an array of faces.
```json
{
    "collision":
    {
        "subShapes":
        [
            {
                "shape": "CONVEX_HULL",
                "faces":
                [
                    {
                        "vertices": [0,0,0]
                    },
                    {
                        "vertices": [1,0,0]
                    },
                    {
                        "vertices": [1,0,1]
                    }
                ]
            }
        ]
    }
}
```

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = ListDisplays();

    //Create a window
    auto window = CreateWindow(displays[0], L"", 0, 0, 1280, 720, WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->Move(0, 1, -3);
    camera->SetFOV(70);

    //Create light
    auto light = CreateLight(world, LIGHT_DIRECTIONAL);
    light->SetRotation(45, 35, 0);

    //Create ground
    auto ground = CreateBox(world, 10, 1, 10);
    ground->SetPosition(0, -0.5, 0);

    //Load model
    auto model = LoadModel(world, "https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Containers/crate01.glb");
    model->SetPosition(0, 3, 0);
    model->SetRotation(0, 0, 15);
    model->SetMass(1);

    //Load collision
    auto collision = LoadCollision("https://github.com/Leadwerks/Documentation/raw/master/Assets/Models/Containers/crate01.phy");
    model->SetCollision(collision);

    while (window->Closed() == false)
    {
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
