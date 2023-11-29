# Package::FileTime

This method returns the last modification time of a file in the package.

## Syntax

- **ulong** **FileTime**(string path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists its last modification time will be returned, otherwise zero will be returned.

```csharp
using System;

namespace Package
{
    class Program
    {
        static void Main(string[] args)
        {
            string filePath = "path/to/file.txt";
            ulong fileTime = FileTime(filePath);
            
            Console.WriteLine("File Time: " + fileTime);
        }
        
        static ulong FileTime(string path)
        {
            // Implementation goes here
        }
    }
}
```