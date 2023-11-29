```csharp
using System;

public class Program
{
    public static void Main(string[] args)
    {
        string path = "C:/Windows/explorer.exe";

        Console.WriteLine("Full path: " + path);
        Console.WriteLine("File name: " + StripDir(path));
        Console.WriteLine("File directory: " + ExtractDir(path));
        Console.WriteLine("File extension: " + ExtractExt(path));    
        Console.WriteLine("File name without extension: " + StripAll(path));
        Console.WriteLine("File path without extension: " + StripExt(path));
    }

    private static string StripExt(string path)
    {
        // Implementation here
    }

    // Other methods omitted for brevity
}
```