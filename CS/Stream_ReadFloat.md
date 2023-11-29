```csharp
using System;
using System.IO;

namespace GameEngineAPI
{
    public class Game
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
            stream.Write(BitConverter.GetBytes(2.0), 0, sizeof(double));
            stream.Write(BitConverter.GetBytes(3.0f), 0, sizeof(float));
            stream.Write(BitConverter.GetBytes(4), 0, sizeof(int));
            stream.Write(BitConverter.GetBytes((short)5), 0, sizeof(short));

            //Change the stream position
            stream.Seek(0, SeekOrigin.Begin);

            //Read back the data
            Console.WriteLine(stream.ReadByte());
            Console.WriteLine(BitConverter.ToDouble(ReadBytes(stream, sizeof(double)), 0));
            Console.WriteLine(BitConverter.ToSingle(ReadBytes(stream, sizeof(float)), 0));
            Console.WriteLine(BitConverter.ToInt32(ReadBytes(stream, sizeof(int)), 0));
            Console.WriteLine(BitConverter.ToInt16(ReadBytes(stream, sizeof(short)), 0));

            //Close the stream
            stream.Close();
        }

        static byte[] ReadBytes(Stream stream, int count)
        {
            byte[] buffer = new byte[count];
            stream.Read(buffer, 0, count);
            return buffer;
        }
    }
}
```