```csharp
using System;
using UltraEngine;

namespace DocumentationExample
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = FileSystem.GetPath(PATH_DOCUMENTS) + "/temp.bin";

            // Open a stream with read and write permissions
            FileSystem.DeleteFile(path);
            var stream = FileSystem.OpenFile(path);
            if (stream == null)
            {
                Console.WriteLine("Failed to write file.");
                return;
            }

            // Write some data
            for (int n = 0; n < 10; ++n)
            {
                stream.WriteInt(n);
            }

            // Change the stream position
            stream.Seek(0);

            // Read back the data
            while (!stream.Eof())
            {
                Console.WriteLine(stream.ReadInt());
            }

            return;
        }
    }
}
```