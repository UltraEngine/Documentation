## SetHrtf

This function enables or disables head-related transfer function audio processing.

### Syntax

- **bool** SetHrtf(**bool** mode)

| Parameter | Description |
|---|---|
| mode | set to true to enable or false to disable |

### Returns

Returns true if the mode is successfully set, otherwise false is returned.

### Remarks

HRTF audio is designed for use with headphones. This should be disabled when using speakers.

HRTF is disabled by default.

### Example

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
        var window = new Window("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowFlags.WINDOW_CENTER | WindowFlags.WINDOW_TITLEBAR);

        //Create a world
        var world = new World();

        //Create a framebuffer
        var framebuffer = new Framebuffer(window);

        //Create a camera
        var camera = new Camera(world);
        camera.SetClearColor(0.125);
        camera.SetFov(70);
        camera.SetPosition(0f, 0f, -3f);
        camera.Listen();
        camera.Turn(0f, 45f, 0f);

        //Create a light
        var light = new BoxLight(world);
        light.SetRotation(35f, 45f, 0f);
        light.SetRange(-10f, 10f);

        //Create a box
        var box = new Box(world);
        box.SetColor(0f, 0f, 1f);

        //Sound
        var sound = new Sound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");
        var speaker = new Speaker(sound);
        speaker.SetLooping(true);
        speaker.SetPosition(box.GetPosition(true));
        speaker.Play();
        speaker.SetRange(10f);

        bool hrtf = false;

        //Main loop
        while (!window.Closed() && !window.KeyDown(KeyCode.KEY_ESCAPE))
        {
            //Toggle HRTF when space key is hit
            if (window.KeyHit(KeyCode.KEY_SPACE))
            {
                hrtf = !hrtf;
                SetHrtf(hrtf);
            }

            //Move and turn with the arrow keys - best experienced with headphones
            if (window.KeyDown(KeyCode.KEY_UP)) camera.Move(0f, 0f, 0.1f);
            if (window.KeyDown(KeyCode.KEY_DOWN)) camera.Move(0f, 0f, -0.1f);
            if (window.KeyDown(KeyCode.KEY_LEFT)) camera.Turn(0f, -1f, 0f);
            if (window.KeyDown(KeyCode.KEY_RIGHT)) camera.Turn(0f, 1f, -0f);

            world.Update();
            world.Render(framebuffer);
        }
    }
}
```