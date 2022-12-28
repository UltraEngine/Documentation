# SetHrtf

This function enables or disables head-related transfer function audio processing.

## Syntax

- bool **SetHrtf**(const bool mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable or false to disable |

## Returns

Returns true if the mode is successfully set, otherwise false is returned.

## Remarks

HRTF audio is designed for use with headphones. This should be disabled when using speakers.

HRTF is disabled by default.

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

    //Create a world
    auto world = CreateWorld();

    //Create a framebuffer
    auto framebuffer = CreateFramebuffer(window);

    //Create a camera
    auto camera = CreateCamera(world);
    camera->SetClearColor(0.125);
    camera->SetFov(70);
    camera->SetPosition(0, 0, -3);
    camera->Listen();
    camera->Turn(0, 45, 0);

    //Create a light
    auto light = CreateBoxLight(world);
    light->SetRotation(35, 45, 0);
    light->SetRange(-10, 10);

    //Create a box
    auto box = CreateBox(world);
    box->SetColor(0, 0, 1);

    //Sound
    auto sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");
    auto speaker = CreateSpeaker(sound);
    speaker->SetLooping(true);
    speaker->SetPosition(box->GetPosition(true));
    speaker->Play();
    speaker->SetRange(10);

    bool hrtf = false;

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Toggle HRTF when space key is hit
        if (window->KeyHit(KEY_SPACE))
        {
            hrtf = not hrtf;
            SetHrtf(hrtf);
        }

        //Move and turn with the arrow keys - best experienced with headphones
        if (window->KeyDown(KEY_UP)) camera->Move(0, 0, 0.1);
        if (window->KeyDown(KEY_DOWN)) camera->Move(0, 0, -0.1);
        if (window->KeyDown(KEY_LEFT)) camera->Turn(0, -1, 0);
        if (window->KeyDown(KEY_RIGHT)) camera->Turn(0, 1, -0);

        world->Update();
        world->Render(framebuffer);
    }
    return 0;
}
```
