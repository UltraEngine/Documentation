## Stream.ReadWString ##
This method reads a wide null-terminated string from the stream.

### Syntax ###
- [WString](WString.md) **ReadWString**()

### Returns ###
Returns a wide string value read from the file.

### Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString path = FileSystem.GetPath(PathType.PATH_DOCUMENTS) + "/temp.txt";

        //Write a new file
        var stream = FileSystem.WriteFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        stream.WriteWString("Hello, world!");
        stream.Close();

        stream = FileSystem.ReadFile(path);
        Console.WriteLine(stream.ReadWString());
    }
}
```