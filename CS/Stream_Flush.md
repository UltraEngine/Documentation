# Stream.Flush

This method writes all queued data to the stream. You generally do not need to call this, as it will be done automatically.

## Syntax

```csharp
void Flush()
```

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = FileSystem.GetPath(PATH_DOCUMENTS) + "/temp.bin";

        //Write a new file
        var stream = FileSystem.WriteFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        byte[] data = new byte[1024];

        stream.Write(data, 0, data.Length);

        Console.WriteLine("File size before Stream.Flush(): " + FileSystem.FileSize(path));

        stream.Flush();

        Console.WriteLine("File size after Stream.Flush(): " + FileSystem.FileSize(path));
    }
}
```