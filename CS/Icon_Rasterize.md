# Icon.Rasterize

This method generates a pixmap from a vector image. A scaling value can be used to create the pixmap at any magnification level.

## Syntax

```csharp
public Pixmap Rasterize(float scale = 1.0f, bool cached = true)
```

| Parameter | Description |
| --- | --- |
| scale | magnification value to create scaled versions of the image |
| cached | if set to true the routine will search for a cached pixmap at the specified scale, otherwise a new pixmap will always be generated |

## Returns

Returns a pixmap at the specified scale.

## Example

```csharp
using System;
using UnityEngine;

public class Example : MonoBehaviour
{
    private void Start()
    {
        //Get the displays
        var displays = UnityUtils.GetDisplays();

        //Create window
        var window = UnityUtils.CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0]);

        //Create user interface
        var ui = UnityUtils.CreateInterface(window);

        //Create a pixmap
        var icon = UnityUtils.LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg");

        //Generate a pixmap
        var pixmap = icon.Rasterize(1.0f);

        //Show the icon
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            var ev = UnityUtils.WaitEvent();
            switch (ev.id)
            {
                case Event.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```