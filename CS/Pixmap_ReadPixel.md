```csharp
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = GetDisplays();

        //Create window
        var window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = CreateInterface(window);

        //Load a pixmap
        var pixmap = LoadPixmap("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");
        pixmap = pixmap.Convert(TEXTURE_RGBA);

        //Write pixel data
        for (int x = 0; x < pixmap.size.x; ++x)
        {
            for (int y = 0; y < pixmap.size.y; ++y)
            {
                int rgba = pixmap.ReadPixel(x, y);
                int r = Red(rgba);
                int g = 0;
                int b = 0;
                rgba = Rgba(r, g, b, 255);
                pixmap.WritePixel(x, y, rgba);
            }
        }

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            Event ev = WaitEvent();
            switch (ev.id)
            {
                case EVENT_WINDOWCLOSE:
                    return;
                default:
                    break;
            }
        }
    }
}
```