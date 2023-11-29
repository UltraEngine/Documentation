## DeleteFile

This function deletes a file in the file system.

### Syntax

- bool **DeleteFile**(string path)

| Parameter | Description |
| --- | --- |
| path | location of file to delete |

### Returns

Returns true if the file was successfully deleted.

### Remarks

It is not possible to restore deleted files. Use this feature with caution.

### Example

```csharp
using System;
using System.IO;

namespace MyApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "temp.bin");

            File.Create(path);
            if (File.Exists(path))
            {
                Console.WriteLine("Failed to write file.");
                return;
            }

            Console.WriteLine("File created.");

            DirectoryInfo dir = new DirectoryInfo(path);
            System.Threading.Thread.Sleep(3000);

            if (File.Exists(path))
            {
                File.Delete(path);
                Console.WriteLine("File deleted.");
            }
            else
            {
                Console.WriteLine("Failed to delete file.");
            }
        }
    }
}
```