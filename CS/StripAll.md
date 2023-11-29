```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = "C:/Windows/explorer.exe";

        Console.WriteLine("Full path: " + path);
        Console.WriteLine("File name: " + StripDir(path));
        Console.WriteLine("File directory: " + ExtractDir(path));
        Console.WriteLine("File extension: " + ExtractExt(path));
        Console.WriteLine("File name without extension: " + StripAll(path));
        Console.WriteLine("File path without extension: " + StripExt(path));
    }
}
```