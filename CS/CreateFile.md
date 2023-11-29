# CreateFile

This function creates a new file on the user's hard drive. The new file will initially be empty. If a file exists at this location it will be overwritten.

## Syntax
- bool **CreateFile**(string path)

| Parameter | Description |
|---|---|
| path | full or relative path to the new file |

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = GetPath(PATH_DOCUMENTS) + "/temp.txt";

        //Create a new file
        if (!CreateFile(path))
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        OpenDir(path);
    }
}
```