# WriteFile

This function creates a new file and returns a stream for write operations.

## Syntax

- `Stream` **WriteFile**(string path)

| Parameter | Description |
|--|--|
| **path** | file path to save |

## Returns

Returns an open stream for write operations if the file was successfully created, otherwise `NULL` is returned.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "/temp.txt";

        //Write a new file
        Stream stream = WriteFile(path);
        if (stream == null)
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        stream.WriteString("Hello, world!");
        stream.Close();

        stream = ReadFile(path);
        Console.WriteLine(stream.ReadString());
    }
}
```