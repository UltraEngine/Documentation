```csharp
using System.IO;

public class Example
{
    public static void Main(string[] args)
    {
        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin");

        //Open a stream with read and write permissions
        File.Delete(path);
        FileStream stream = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        //Write some data
        stream.WriteByte(1);
        stream.WriteDouble(2.0);
        stream.WriteSingle(3.0);
        stream.WriteInt32(4);
        stream.WriteInt16(5);

        //Change the stream position
        stream.Seek(0, SeekOrigin.Begin);

        //Read back the data
        Console.WriteLine(stream.ReadByte());
        Console.WriteLine(stream.ReadDouble());
        Console.WriteLine(stream.ReadSingle());
        Console.WriteLine(stream.ReadInt32());
        Console.WriteLine(stream.ReadInt16());

        //Close the stream
        stream.Close();
    }
}
```
Note: In C#, the `Stream` class is an abstract class, so you'll need to use one of its concrete implementations, such as `FileStream`, for file I/O operations. Additionally, the `Print` function from the example was replaced with `Console.WriteLine` in the C# version.