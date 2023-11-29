# Speaker.SetFilter

This method adds an audio filter to the speaker.

## Syntax

```csharp
void SetFilter(AudioFilter filter, int index = 0);
```

| Parameter | Description |
|---|---|
| filter | audio filter to set |
| index | sound effect index to use, for multiple filters |

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = World.Create();

        //Create a framebuffer
        var framebuffer = Framebuffer.Create(window);

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.SetPosition(0, 0, -3);
        camera.Listen();

        //Create a light
        var light = BoxLight.Create(world);
        light.SetRotation(35, 45, 0);
        light.SetRange(-10, 10);

        //Create a box
        var box = Box.Create(world);
        box.SetColor(0, 0, 1);

        //Sound
        var sound = Sound.Load("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");
        var speaker = Speaker.Create(sound);
        speaker.SetLooping(true);
        speaker.SetPosition(box.GetPosition(true));
        speaker.Play();
        speaker.SetRange(10);

        //Main loop
        while (!window.Closed() && !window.KeyDown(Key.KEY_ESCAPE))
        {
            //Add filter when space key is pressed
            if (window.KeyHit(Key.KEY_SPACE))
            {
                var filter = AudioFilter.Load("https://raw.githubusercontent.com/UltraEngine/Assets/main/Sound/Filters/EAXReverb/SewerPipe.json");
                speaker.SetFilter(filter);
            }

            //Move and turn with the arrow keys - best experienced with headphones
            if (window.KeyDown(Key.KEY_UP)) camera.Move(0, 0, 0.1);
            if (window.KeyDown(Key.KEY_DOWN)) camera.Move(0, 0, -0.1);
            if (window.KeyDown(Key.KEY_LEFT)) camera.Turn(0, -1, 0);
            if (window.KeyDown(Key.KEY_RIGHT)) camera.Turn(0, 1, -0);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```