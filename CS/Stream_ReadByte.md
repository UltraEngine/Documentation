```csharp
using System;
using System.IO;

namespace NewGameEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/temp.bin";

            //Open a stream with read and write permissions
            File.Delete(path);
            Stream stream = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            if (stream == null)
            {
                Console.WriteLine("Failed to write file.");
                return;
            }

            //Write some data
            stream.WriteByte(1);
            BinaryWriter writer = new BinaryWriter(stream);
            writer.Write(2.0);
            writer.Write(3.0f);
            writer.Write(4);
            writer.Write((short)5);

            //Change the stream position
            stream.Seek(0, SeekOrigin.Begin);

            //Read back the data
            Console.WriteLine(stream.ReadByte());
            BinaryReader reader = new BinaryReader(stream);
            Console.WriteLine(reader.ReadDouble());
            Console.WriteLine(reader.ReadSingle());
            Console.WriteLine(reader.ReadInt32());
            Console.WriteLine(reader.ReadInt16());

            //Close the stream
            stream.Close();
        }
    }
}
```
