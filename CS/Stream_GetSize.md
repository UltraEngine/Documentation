# Stream.GetSize #
This method returns the size of the stream.

## Syntax ##
ulong **GetSize**()

## Returns ##
Returns the stream size in bytes.

## Example

```csharp
using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin");

        // Open a stream with write permissions
        using (var stream = File.Create(path))
        {
            // Write a byte
            stream.WriteByte(1);
            Console.WriteLine("Position: " + stream.Position);
            Console.WriteLine("Size: " + stream.Length);

            // Write a short
            byte[] shortBytes = BitConverter.GetBytes((short)2);
            stream.Write(shortBytes, 0, shortBytes.Length);
            Console.WriteLine("Position: " + stream.Position);
            Console.WriteLine("Size: " + stream.Length);

            // Write an integer
            byte[] intBytes = BitConverter.GetBytes(3);
            stream.Write(intBytes, 0, intBytes.Length);
            Console.WriteLine("Position: " + stream.Position);
            Console.WriteLine("Size: " + stream.Length);

            // Write a float
            byte[] floatBytes = BitConverter.GetBytes(4f);
            stream.Write(floatBytes, 0, floatBytes.Length);
            Console.WriteLine("Position: " + stream.Position);
            Console.WriteLine("Size: " + stream.Length);

            // Write a double
            byte[] doubleBytes = BitConverter.GetBytes(5d);
            stream.Write(doubleBytes, 0, doubleBytes.Length);
            Console.WriteLine("Position: " + stream.Position);
            Console.WriteLine("Size: " + stream.Length);
        }
    }
}
```