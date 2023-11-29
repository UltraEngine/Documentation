# Stream.GetPosition #
This method returns the current offset in the stream for read and write operations.

## Syntax ##
```csharp
ulong **GetPosition**()
```

## Returns ##
Returns the stream position in bytes.

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = FileSystem.GetPath(FileSystem.PATH_DOCUMENTS) + "/temp.bin";

        //Open a stream with write permissions
        var stream = FileSystem.WriteFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        //Write a byte
        stream.WriteByte(1);
        Console.WriteLine("Position: " + stream.GetPosition());
        Console.WriteLine("Size: " + stream.GetSize());

        //Write a short
        stream.WriteShort(2);
        Console.WriteLine("Position: " + stream.GetPosition());
        Console.WriteLine("Size: " + stream.GetSize());

        //Write an integer
        stream.WriteInt(3);
        Console.WriteLine("Position: " + stream.GetPosition());
        Console.WriteLine("Size: " + stream.GetSize());

        //Write a float
        stream.WriteFloat(4);
        Console.WriteLine("Position: " + stream.GetPosition());
        Console.WriteLine("Size: " + stream.GetSize());

        //Write a double
        stream.WriteDouble(5);
        Console.WriteLine("Position: " + stream.GetPosition());
        Console.WriteLine("Size: " + stream.GetSize());
    }
}
```