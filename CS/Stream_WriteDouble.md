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
        FileStream stream = File.OpenWrite(path);

        //Write some data
        stream.WriteByte(1);
        WriteDouble(stream, 2.0);
        stream.Write(BitConverter.GetBytes(3.0f), 0, sizeof(float));
        stream.Write(BitConverter.GetBytes(4), 0, sizeof(int));
        stream.Write(BitConverter.GetBytes(5), 0, sizeof(short));

        //Change the stream position
        stream.Seek(0, SeekOrigin.Begin);

        //Read back the data
        Console.WriteLine(stream.ReadByte());
        Console.WriteLine(ReadDouble(stream));
        Console.WriteLine(BitConverter.ToSingle(ReadBytes(stream, sizeof(float)), 0));
        Console.WriteLine(BitConverter.ToInt32(ReadBytes(stream, sizeof(int)), 0));
        Console.WriteLine(BitConverter.ToInt16(ReadBytes(stream, sizeof(short)), 0));

        //Close the stream
        stream.Close();
    }
    
    static void WriteDouble(FileStream stream, double d)
    {
        byte[] bytes = BitConverter.GetBytes(d);
        stream.Write(bytes, 0, bytes.Length);
    }
    
    static double ReadDouble(FileStream stream)
    {
        byte[] bytes = new byte[sizeof(double)];
        stream.Read(bytes, 0, bytes.Length);
        return BitConverter.ToDouble(bytes, 0);
    }
    
    static byte[] ReadBytes(FileStream stream, int count)
    {
        byte[] bytes = new byte[count];
        stream.Read(bytes, 0, bytes.Length);
        return bytes;
    }
}
```