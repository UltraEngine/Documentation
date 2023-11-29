# Stream.WriteShort #
This method writes an unsigned short value to the stream at the current position.

## Syntax ##
- void **WriteInt**(ushort i)

| Parameter | Description |
| --- | --- |
| i | value to write |

## Example

```csharp
using System;
using System.IO;

class Program
{
    static void Main(string[] args)
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
        stream.WriteFloat(3.0f);
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