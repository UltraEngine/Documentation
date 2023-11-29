# Stream.ReadShort #
This method reads an unsigned short value from the stream.

## Syntax ##
- ushort **ReadShort**()

## Returns ##
Returns an unsigned short value read from the stream.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString path = GetPath(PATH_DOCUMENTS) + "/temp.bin";

        //Open a stream with read and write permissions
        DeleteFile(path);
        Stream stream = OpenFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        //Write some data
        stream.WriteByte(1);
        stream.WriteDouble(2.0);
        stream.WriteFloat(3.0f);
        stream.WriteInt(4);
        stream.WriteShort(5);

        //Change the stream position
        stream.Seek(0);

        //Read back the data
        Console.WriteLine(stream.ReadByte());
        Console.WriteLine(stream.ReadDouble());
        Console.WriteLine(stream.ReadFloat());
        Console.WriteLine(stream.ReadInt());
        Console.WriteLine(stream.ReadShort());

        //Close the stream
        stream.Close();

        return;
    }
}
```