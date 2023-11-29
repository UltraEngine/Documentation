```csharp
using System;
using UltraEngine;

namespace ExtractExtExample
{
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

            Console.ReadLine();
        }
        
        static string StripDir(string path)
        {
            // implementation
        }

        static string ExtractDir(string path)
        {
            // implementation
        }

        static string ExtractExt(string path)
        {
            // implementation
        }

        static string StripAll(string path)
        {
            // implementation
        }

        static string StripExt(string path)
        {
            // implementation
        }
    }
}
```