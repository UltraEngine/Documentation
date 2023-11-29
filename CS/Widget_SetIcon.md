#### Widget.SetIcon

This method adds an icon to the widget.

##### Syntax

```csharp
public void SetIcon(Icon icon, PixmapAlignment alignment = PixmapAlignment.PixmapCenter, float scale = 1.0f)
```

| Parameter | Description |
| --- | --- |
| icon | icon to set |
| alignment | pixmap alignment mode, may be PixmapAlignment.PixmapCenter, PixmapAlignment.PixmapContain, PixmapAlignment.PixmapCover, PixmapAlignment.PixmapStretch, or PixmapAlignment.PixmapFit |
| scale | icon scale |

##### Example

```csharp
using System;
using UnityEngine;
using UnityEngine.UI;
using Leadwerks;

public class Example : MonoBehaviour
{
    private Display[] displays;
    private Window window;
    private Interface ui;

    private void Start()
    {
        //Get the displays
        displays = Engine.GetDisplays();

        //Create window
        window = Engine.CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0]);

        //Create user interface
        ui = Engine.CreateInterface(window);

        //Create a pixmap
        Icon icon = Engine.LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg");

        //Show the icon
        ui.root.SetIcon(icon);
    }

    private void Update()
    {
        while (true)
        {
            Event ev = Engine.WaitEvent();
            switch (ev.id)
            {
                case EventType.WindowClose:
                    return;
            }
        }
    }
}
```