```csharp
using System;
using System.IO;

class Program
{
    static void Main()
    {
        string path = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/temp.txt";

        // Write a new file
        StreamWriter stream = new StreamWriter(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        stream.WriteLine("Hello, world!");
        stream.Close();

        stream = new StreamReader(path);
        Console.WriteLine(stream.ReadLine());
    }
}
```