```csharp
using System;
using System.IO;
using Leadwerks;

namespace Example
{
    class Program
    {
        static void Main(string[] args)
        {
            //Get the displays
            var displays = Display.GetDisplays();

            //Create window
            var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

            //Create user interface
            var ui = UI.Create(window);

            //Load an asset
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.dds");
            if (!File.Exists(path))
            {
                using (var client = new System.Net.WebClient())
                {
                    client.DownloadFile("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Ground/dirt01.dds", path);
                }
            }

            //Load the file from the hard drive
            var pixmap = Pixmap.Load(path);

            //Show the pixmap
            ui.Root.SetPixmap(pixmap);

            var button = Button.Create("Modify Pixmap", 10, 10, 100, 30, ui.Root);

            while (true)
            {
                var ev = WaitEvent();
                switch (ev.ID)
                {
                    case Event.WidgetAction:
                        if (ev.Source == button)
                        {
                            //Make a copy of the pixmap, modify it, and overwrite the file
                            var pixmap2 = pixmap.Copy().As<Pixmap>();
                            if (pixmap2.Format != TextureFormat.Rgba) pixmap2.Convert(TextureFormat.Rgba);
                            int px = Random.Range(0, pixmap.Size.X - 1 - 100);
                            int py = Random.Range(0, pixmap.Size.Y - 1 - 100);
                            int color = new Color(Random.Range(255), Random.Range(255), Random.Range(255), 255);
                            for (int x = 0; x < 100; ++x)
                            {
                                for (int y = 0; y < 100; ++y)
                                {
                                    pixmap2.WritePixel(px + x, py + y, color);
                                }
                            }
                            pixmap2.Save(path);

                            //Reload the pixmap from the file
                            pixmap.Reload();

                            //Redraw the panel
                            ui.Root.Paint();
                        }
                        break;
                    case Event.WindowClose:
                        return;
                        break;
                }
            }
        }
    }
}
```