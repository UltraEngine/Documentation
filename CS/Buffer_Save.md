```csharp
using System;
using System.IO;

namespace UltraEngine
{
    class Program
    {
        static void Main(string[] args)
        {
            //Create a buffer
            Buffer buffer = CreateBuffer(16);
            buffer.PokeInt(0, 1);
            buffer.PokeInt(4, 2);
            buffer.PokeInt(8, 3);
            buffer.PokeInt(12, 4);

            //Save the buffer
            string path = GetPath(PathType.PATH_DOCUMENTS) + "/temp.bin";
            if (!buffer.Save(path))
            {
                throw new Exception("Failed to save buffer.");
            }

            //Load the buffer
            buffer = LoadBuffer(path);
            if (buffer == null)
            {
                throw new Exception("Failed to load buffer.");
            }
            DeleteFile(path);

            Assert(buffer.GetSize() == 16);
            Print(buffer.PeekInt(0));
            Print(buffer.PeekInt(4));
            Print(buffer.PeekInt(8));
            Print(buffer.PeekInt(12));
        }
    }
}
```