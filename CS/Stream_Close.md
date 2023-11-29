```csharp
using System.IO;

namespace YourNamespace
{
    class YourClass
    {
        static int Main(string[] args)
        {
            string path = UltraEngine.GetPath(UltraEngine.PathType.PATH_DOCUMENTS) + "/temp.bin";

            //Open a stream with read and write permissions
            File.Delete(path);
            var stream = File.Open(path, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            if (stream == null)
            {
                UltraEngine.Print("Failed to write file.");
                return 0;
            }

            //Write some data
            stream.WriteByte(1);
            stream.Write(BitConverter.GetBytes(2.0), 0, sizeof(double));
            stream.Write(BitConverter.GetBytes(3.0f), 0, sizeof(float));
            stream.Write(BitConverter.GetBytes(4), 0, sizeof(int));
            stream.Write(BitConverter.GetBytes(5), 0, sizeof(short));

            //Change the stream position
            stream.Seek(0, SeekOrigin.Begin);

            //Read back the data
            UltraEngine.Print(stream.ReadByte());
            byte[] doubleBytes = new byte[sizeof(double)];
            byte[] floatBytes = new byte[sizeof(float)];
            byte[] intBytes = new byte[sizeof(int)];
            byte[] shortBytes = new byte[sizeof(short)];
            stream.Read(doubleBytes, 0, sizeof(double));
            stream.Read(floatBytes, 0, sizeof(float));
            stream.Read(intBytes, 0, sizeof(int));
            stream.Read(shortBytes, 0, sizeof(short));
            UltraEngine.Print(BitConverter.ToDouble(doubleBytes, 0));
            UltraEngine.Print(BitConverter.ToSingle(floatBytes, 0));
            UltraEngine.Print(BitConverter.ToInt32(intBytes, 0));
            UltraEngine.Print(BitConverter.ToInt16(shortBytes, 0));

            //Close the stream
            stream.Close();

            return 0;
        }
    }
}
```