```csharp
using System.IO;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = Path.Combine(GetPath(PATH_DOCUMENTS), "temp.txt");

        //Write a new file
        var stream = new StreamWriter(path);
        if (stream == null)
        {
            Print("Failed to write file.");
            return;
        }

        stream.WriteLine("Hello, world!");
        stream.Close();

        stream = new StreamReader(path);
        Print(stream.ReadLine());
    }
}
```