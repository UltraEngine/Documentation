# LoadSound

## Syntax
- `Sound LoadSound`(string path, LoadFlags flags = LOAD_DEFAULT)
- `Sound LoadSound`(Stream stream, LoadFlags flags = LOAD_DEFAULT)

|Parameter|Description|
|-|-|
|path|file name to load|
|stream|stream to load the file from|
|flags|optional loading flags, can be LOAD_DEFAULT or any combination of LOAD_UNMANAGED and LOAD_QUIET |

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Engine.GetDisplays();

        //Create window
        var window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], WindowFlags.WINDOW_TITLEBAR | WindowFlags.WINDOW_CENTER);

        //Load sound
        var sound = Engine.LoadSound("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Sound/notification.wav");

        //Play sound
        var speaker = Engine.CreateSpeaker();
        speaker.SetSound(sound);
        speaker.SetLooping(true);
        speaker.Play();

        while (!window.Closed)
        {
            if (window.KeyDown(Key.KEY_ESCAPE))
                break;
        }
    }
}
```