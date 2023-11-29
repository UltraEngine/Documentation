# ReadFile #
This function loads a file from a path and returns a stream.

## Syntax ##
- `Stream` **ReadFile**(string path, LoadFlags flags = LOAD_DEFAULT)

### Parameters ###
|  Name | Description   |
|--|--|
| **path** | file name or URL to load |
| **flags** | optional load settings |

## Returns ##
Returns a new [Stream](Stream.md) object If the file was successfully read, otherwise NULL is returned.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = GetPath(PATH_DOCUMENTS) + "/temp.txt";

        //Write a new file
        var stream = WriteFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        stream.WriteLine("Hello, world!");
        stream.Close();

        stream = ReadFile(path);
        Console.WriteLine(stream.ReadLine());

        return;
    }
}
```