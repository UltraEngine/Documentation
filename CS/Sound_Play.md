# Sound.Play

This method plays a sound once and returns a speaker object.

## Syntax

- `Speaker` **Play**()

## Returns

Returns a new `Speaker` object that can be used to control the sound.

## Example

```csharp
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Window.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0], WindowStyle.Titlebar | WindowStyle.Center);

        //Load sound
        var sound = Sound.Load("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Sound/notification.wav");
        sound.Play();

        while (!window.Closed && !window.KeyDown(Key.Escape))
        {
            // Play sound when space key is pressed
            if (window.KeyHit(Key.Space)) sound.Play();
            Sleep(16);
        }
    }
}
```