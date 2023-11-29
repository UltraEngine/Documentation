```csharp
using System;
using System.Collections.Generic;
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Leadwerks.GetDisplays();

        //Create window
        var window = Leadwerks.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Leadwerks.CreateInterface(window);

        //Create a pixmap
        var pixmap = Leadwerks.LoadPixmap("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds");

        //Resize the pixmap
        pixmap = pixmap.Resize(128, 128);

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            var ev = Leadwerks.WaitEvent();
            switch (ev.id)
            {
                case Leadwerks.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```