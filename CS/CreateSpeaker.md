# CreateSpeaker

This function creates a new speaker object.

## Syntax

- [Speaker](Speaker.md) **CreateSpeaker**([Sound](Sound.md) sound = null)

| Parameter | Description |
|---|---|
| sound | optional sound to set |

## Returns

Returns a new speaker.

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

        //Create window
        var window = new Window("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_CENTER);

        //Load sound
        var sound = new Sound("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Sound/notification.wav");

        var speaker = CreateSpeaker(sound);

        while (!window.Closed && !window.KeyDown(KeyCodes.KEY_ESCAPE))
        {
            //Play sound when space key is pressed
            if (window.KeyHit(KeyCodes.KEY_SPACE)) speaker.Play();
            Sleep(16);
        }
    }
}
```