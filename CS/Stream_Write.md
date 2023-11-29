```csharp
using System;
using System.IO;

namespace GameEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin");

            // Open a stream with read and write permissions
            if (File.Exists(path))
            {
                File.Delete(path);
            }
            var stream = File.OpenWrite(path);
            if (stream == null)
            {
                Console.WriteLine("Failed to write file.");
                return;
            }

            // Initialize data
            int[] data = new int[10];
            for (int n = 0; n < 10; ++n)
            {
                data[n] = 100 + n;
            }

            // Write data to the stream
            stream.Write(BitConverter.GetBytes(data[0]), 0, sizeof(int) * data.Length);

            // Change the stream position
            stream.Seek(0, SeekOrigin.Begin);

            // Read back the data
            byte[] buffer = new byte[sizeof(int) * data.Length];
            stream.Read(buffer, 0, buffer.Length);
            for (int n = 0; n < 10; ++n)
            {
                data[n] = BitConverter.ToInt32(buffer, n * sizeof(int));
            }

            foreach (int value in data)
            {
                Console.WriteLine(value);
            }
        }
    }
}
```