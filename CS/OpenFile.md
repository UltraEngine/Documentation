# OpenFile

This function opens a file and returns a stream for read and write operations. If no file exists at the specified path, a new empty file will be created.

## Syntax

- **Stream** **OpenFile**(string path)

| Parameter | Description |
|---|---|
| **path** | file path to open |

## Returns

Returns an open stream for read and write operations if the file was successfully created, otherwise NULL is returned.

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
        Stream stream = OpenFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        //Write some data
        stream.WriteByte(1);
        stream.Write(BitConverter.GetBytes(2.0));
        stream.Write(BitConverter.GetBytes(3.0f));
        stream.Write(BitConverter.GetBytes(4));
        stream.Write(BitConverter.GetBytes(5));

        //Change the stream position
        stream.Seek(0, SeekOrigin.Begin);

        //Read back the data
        Console.WriteLine(stream.ReadByte());
        Console.WriteLine(BitConverter.ToDouble(ReadExactBytes(stream, sizeof(double)), 0));
        Console.WriteLine(BitConverter.ToSingle(ReadExactBytes(stream, sizeof(float)), 0));
        Console.WriteLine(BitConverter.ToInt32(ReadExactBytes(stream, sizeof(int)), 0));
        Console.WriteLine(BitConverter.ToInt16(ReadExactBytes(stream, sizeof(short)), 0));

        //Close the stream
        stream.Close();
    }

    static byte[] ReadExactBytes(Stream stream, int count)
    {
        byte[] buffer = new byte[count];
        int bytesRead = stream.Read(buffer, 0, count);
        if (bytesRead < count)
            throw new IOException("End of stream reached before reading all bytes.");
        return buffer;
    }
}
```