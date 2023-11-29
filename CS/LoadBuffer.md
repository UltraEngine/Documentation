```csharp
using System;
using Ultrapack;

class Program
{
    static void Main(string[] args)
    {
        //Create a buffer
        var buffer = new Buffer(16);
        buffer.PokeInt(0, 1);
        buffer.PokeInt(4, 2);
        buffer.PokeInt(8, 3);
        buffer.PokeInt(12, 4);

        //Save the buffer
        string path = Path.GetFullPath(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin"));
        buffer.Save(path);

        //Load the buffer
        buffer = LoadBuffer(path);
        if (buffer == null) throw new Exception("Failed to load buffer.");
        File.Delete(path);

        Debug.Assert(buffer.Size == 16);
        Console.WriteLine(buffer.PeekInt(0));
        Console.WriteLine(buffer.PeekInt(4));
        Console.WriteLine(buffer.PeekInt(8));
        Console.WriteLine(buffer.PeekInt(12));
    }
}
```