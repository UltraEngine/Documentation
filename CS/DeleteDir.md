```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = Path.GetPath(PathType.PATH_DOCUMENTS) + "/Temp Folder";

        CreateDir(path);
        if (FileType(path) != 2)
        {
            Console.WriteLine("Failed to write folder.");
            return;
        }

        Console.WriteLine("Folder created.");

        OpenDir(ExtractDir(path));
        Sleep(3000);

        if (DeleteDir(path))
        {
            Console.WriteLine("Folder deleted.");
        }
        else
        {
            Console.WriteLine("Failed to delete folder.");
        }

        return;
    }
}
```