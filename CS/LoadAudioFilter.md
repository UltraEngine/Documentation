# LoadAudioFilter

This function loads an audio filter from a file. Audio filters are stored in JSON files and can be found in the "Sound/Filters" directory of a new project.

## Syntax

- [AudioFilter](AudioFilter.md) **LoadAudioFilter**(string path, LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
|---|---|
| path | file path to load |
| flags | optional load flags |

## Returns

Returns the loaded audio filter if successful, otherwise null is returned.

## Example

```csharp
using System;
using UltraEngine;

public class Game
{
    static void Main(string[] args)
    {
        // Get the displays
        var displays = GetDisplays();

        // Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR);

        // Create a world
        var world = CreateWorld();

        // Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        // Create a camera
        var camera = CreateCamera(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.SetPosition(0, 0, -3);
        camera.Listen();

        // Create a light
        var light = CreateBoxLight(world);
        light.SetRotation(35, 45, 0);
        light.SetRange(-10, 10);

        // Create a box
        var box = CreateBox(world);
        box.SetColor(0, 0, 1);

        // Sound
        var sound = LoadSound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");
        var speaker = CreateSpeaker(sound);
        speaker.SetLooping(true);
        speaker.SetPosition(box.GetPosition(true));
        speaker.Play();
        speaker.SetRange(10);

        // Main loop
        while (!window.Closed() && !window.KeyDown(Keys.KEY_ESCAPE))
        {
            // Add filter when space key is pressed
            if (window.KeyHit(Keys.KEY_SPACE))
            {
                var filter = LoadAudioFilter("https://raw.githubusercontent.com/UltraEngine/Assets/main/Sound/Filters/EAXReverb/SewerPipe.json");
                speaker.SetFilter(filter);
            }

            // Move and turn with the arrow keys - best experienced with headphones
            if (window.KeyDown(Keys.KEY_UP)) camera.Move(0, 0, 0.1f);
            if (window.KeyDown(Keys.KEY_DOWN)) camera.Move(0, 0, -0.1f);
            if (window.KeyDown(Keys.KEY_LEFT)) camera.Turn(0, -1, 0);
            if (window.KeyDown(Keys.KEY_RIGHT)) camera.Turn(0, 1, -0);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```