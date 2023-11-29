```csharp
using System;

namespace YourNamespace
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
        }

        static string StripDir(string path)
        {
            // Function implementation
        }

        static string ExtractDir(string path)
        {
            // Function implementation
        }

        static string ExtractExt(string path)
        {
            // Function implementation
        }

        static string StripAll(string path)
        {
            // Function implementation
        }

        static string StripExt(string path)
        {
            // Function implementation
        }
    }
}
```