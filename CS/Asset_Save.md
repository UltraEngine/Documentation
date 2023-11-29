```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Load an asset
        var pixmap = LoadPixmap("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Brick/brickwall01.dds");

        //Save the asset
        string path = GetPath(PATH_DOCUMENTS) + "/temp.dds";
        pixmap.Save(path);

        //Open the file
        RunFile(path);
    }
}
```