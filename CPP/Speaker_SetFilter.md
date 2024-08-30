# Speaker::SetFilter

This method adds an audio filter to the speaker.

## Syntax

- bool **SetFilter**(const AudioFilter filter)

| Parameter | Description |
|---|---|
| filter | audio filter to set, can be any of the values in the list below |

## Returns

Returns true if the audio filter was successfully set, otherwise false is returned.

## Remarks

The following audio filter constants are available to use.

- AUDIOFILTER_NONE
- AUDIOFILTER_REVERB_GENERIC
- AUDIOFILTER_REVERB_PADDEDCELL
- AUDIOFILTER_REVERB_ROOM
- AUDIOFILTER_REVERB_BATHROOM
- AUDIOFILTER_REVERB_LIVINGROOM
- AUDIOFILTER_REVERB_STONEROOM
- AUDIOFILTER_REVERB_AUDITORIUM
- AUDIOFILTER_REVERB_CONCERTHALL
- AUDIOFILTER_REVERB_CAVE
- AUDIOFILTER_REVERB_ARENA
- AUDIOFILTER_REVERB_HANGAR
- AUDIOFILTER_REVERB_CARPETEDHALLWAY
- AUDIOFILTER_REVERB_HALLWAY
- AUDIOFILTER_REVERB_STONECORRIDOR
- AUDIOFILTER_REVERB_ALLEY
- AUDIOFILTER_REVERB_FOREST
- AUDIOFILTER_REVERB_CITY
- AUDIOFILTER_REVERB_MOUNTAINS
- AUDIOFILTER_REVERB_QUARRY
- AUDIOFILTER_REVERB_PLAIN
- AUDIOFILTER_REVERB_PARKINGLOT
- AUDIOFILTER_REVERB_SEWERPIPE
- AUDIOFILTER_REVERB_UNDERWATER
- AUDIOFILTER_REVERB_DRUGGED
- AUDIOFILTER_REVERB_DIZZY
- AUDIOFILTER_REVERB_PSYCHOTIC

#### Castle
- AUDIOFILTER_REVERB_CASTLE_SMALLROOM
- AUDIOFILTER_REVERB_CASTLE_SHORTPASSAGE
- AUDIOFILTER_REVERB_CASTLE_MEDIUMROOM
- AUDIOFILTER_REVERB_CASTLE_LARGEROOM
- AUDIOFILTER_REVERB_CASTLE_LONGPASSAGE
- AUDIOFILTER_REVERB_CASTLE_HALL
- AUDIOFILTER_REVERB_CASTLE_CUPBOARD
- AUDIOFILTER_REVERB_CASTLE_COURTYARD
- AUDIOFILTER_REVERB_CASTLE_ALCOVE

#### Factory
- AUDIOFILTER_REVERB_FACTORY_SMALLROOM
- AUDIOFILTER_REVERB_FACTORY_SHORTPASSAGE
- AUDIOFILTER_REVERB_FACTORY_MEDIUMROOM
- AUDIOFILTER_REVERB_FACTORY_LARGEROOM
- AUDIOFILTER_REVERB_FACTORY_LONGPASSAGE
- AUDIOFILTER_REVERB_FACTORY_HALL
- AUDIOFILTER_REVERB_FACTORY_CUPBOARD
- AUDIOFILTER_REVERB_FACTORY_COURTYARD
- AUDIOFILTER_REVERB_FACTORY_ALCOVE

#### Ice Palace
- AUDIOFILTER_REVERB_ICEPALACE_SMALLROOM
- AUDIOFILTER_REVERB_ICEPALACE_SHORTPASSAGE
- AUDIOFILTER_REVERB_ICEPALACE_MEDIUMROOM
- AUDIOFILTER_REVERB_ICEPALACE_LARGEROOM
- AUDIOFILTER_REVERB_ICEPALACE_LONGPASSAGE
- AUDIOFILTER_REVERB_ICEPALACE_HALL
- AUDIOFILTER_REVERB_ICEPALACE_CUPBOARD
- AUDIOFILTER_REVERB_ICEPALACE_COURTYARD
- AUDIOFILTER_REVERB_ICEPALACE_ALCOVE

#### Space Station
- AUDIOFILTER_REVERB_SPACESTATION_SMALLROOM
- AUDIOFILTER_REVERB_SPACESTATION_SHORTPASSAGE
- AUDIOFILTER_REVERB_SPACESTATION_MEDIUMROOM
- AUDIOFILTER_REVERB_SPACESTATION_LARGEROOM
- AUDIOFILTER_REVERB_SPACESTATION_LONGPASSAGE
- AUDIOFILTER_REVERB_SPACESTATION_HALL
- AUDIOFILTER_REVERB_SPACESTATION_CUPBOARD
- AUDIOFILTER_REVERB_SPACESTATION_ALCOVE

#### Wooden Galleon
- AUDIOFILTER_REVERB_WOODEN_SMALLROOM
- AUDIOFILTER_REVERB_WOODEN_SHORTPASSAGE
- AUDIOFILTER_REVERB_WOODEN_MEDIUMROOM
- AUDIOFILTER_REVERB_WOODEN_LARGEROOM
- AUDIOFILTER_REVERB_WOODEN_LONGPASSAGE
- AUDIOFILTER_REVERB_WOODEN_HALL
- AUDIOFILTER_REVERB_WOODEN_CUPBOARD
- AUDIOFILTER_REVERB_WOODEN_COURTYARD
- AUDIOFILTER_REVERB_WOODEN_ALCOVE

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

    //Main loop
    while (window->Closed() == false and window->KeyDown(KEY_ESCAPE) == false)
    {
        //Add filter when space key is pressed
        if (window->KeyHit(KEY_SPACE))
        { 
            speaker->SetFilter(AUDIOFILTER_REVERB_SEWERPIPE);
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
