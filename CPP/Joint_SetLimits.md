# Joint::SetLimits

This method sets the limits of a hinge, slider, or ball and socket joint.

## Syntax

- void **SetLimits**(const dFloat lower, const dFloat upper)

| Parameter | Description |
|---|---|
| lower | minimum joint angle or offset |
| upper | maximum joint angle or offset |

## Remarks

For hinge and slider joints, if both the minimum and maximum limits are set to zero, joint limits will be disabled.

For ball and socket joints, the minimum limit will be used as a maximum cone angle, and the maximum limit will be used for the maximum twist angle.

For ball and socket joints, if the minimum limit is set to zero and the maximum limit is set to 360, joint limits will be disabled.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    //Get the displays
    auto displays = GetDisplays();

    //Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a world
    auto world = CreateWorld();

    //Create a camera    
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetPosition(0, 0, -6);

    //Create light
    auto light = CreateBoxLight(world);
    light->SetRange(-20, 20);
    light->SetRotation(35, 35, 0);
    light->SetColor(3);

    auto parent = CreateBox(world);
    parent->SetMass(1);
    parent->SetColor(0, 0, 1);

    auto child = CreateBox(world);
    child->SetPosition(4, 0, 0);
    child->SetMass(1);
    child->SetColor(0, 1, 0);

    auto hinge = CreateHingeJoint(parent->position, Vec3(0, 0, 1), NULL, parent);
    hinge->SetMaxTorque(100);
    
    auto slider = CreateSliderJoint(parent->position, Vec3(-1, 0, 0), parent, child);
    slider->SetLimits(0, 8);

    float a = 0;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        a += 1;
        hinge->SetPose(a);
        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
