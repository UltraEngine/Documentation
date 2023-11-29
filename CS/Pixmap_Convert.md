```csharp
using Leadwerks;

public static class Program
{
    public static void Main(string[] args)
    {
        //Get the displays
        var displays = Window.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = window.CreateInterface();

        //Load a pixmap
        var pixmap = Pixmap.Load("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.dds");

        //Convert to single red channel
        pixmap = pixmap.Convert(TextureFormat.RED);

        //Show the pixmap
        ui.root.SetPixmap(pixmap);

        while (true)
        {
            var ev = window.WaitEvent();
            switch (ev.id)
            {
                case EventId.WindowClose:
                    return;
            }
        }
    }
}
```