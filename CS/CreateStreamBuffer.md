```csharp
//---------------------------------------------------------------------------------------------------
// 
// This example will load a heightmap into a streambuffer and create a "virtual" pixmap, without 
// loading the entire file into memory. A sub-section of the heightmap will be extracted and saved.
// This can be used to work with very large image files that cannot be loaded in memory.
// 
//---------------------------------------------------------------------------------------------------

using System;
using Leadwerks;

public class Program
{
    public static void Main(string[] args)
    {
        //Load FreeImage plugin
        var plugin = Plugin.Load("Plugins/FITextureLoader");
        if (plugin == null)
        {
            Console.WriteLine("Failed to load FreeImage plugin.");
            return;
        }

        //Load heightmap data
        var stream = File.ReadFile("https://github.com/Leadwerks/Documentation/raw/master/Assets/Terrain/1024.r16");
        var streambuffer = CreateStreamBuffer(stream, 0, stream.GetSize());
        var pixmap = CreatePixmap(1024, 1024, TextureInternalFormat.TEXTURE_R16, streambuffer);

        //Create sub-image and save
        var submap = CreatePixmap(256, 256, TextureInternalFormat.TEXTURE_R16);
        pixmap.CopyRect(0, 0, 256, 256, submap, 0, 0);
        submap = submap.Convert(TextureInternalFormat.TEXTURE_RGBA);
        submap.Save("output.png");

        RunFile("output.png");
    }
}
```