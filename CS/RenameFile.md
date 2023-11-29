# RenameFile
This function changes the name of an existing file.

## Syntax 
- bool **RenameFile**(string src, string dest)

| Parameter | Description |
|---|---|
| src | existing file path |
| dest | new file name |

## Returns
Returns true if the file was successfully renamed, otherwise false is returned.

```csharp
using System;
using UltraEngine;

public class Example
{
    public static void Main(string[] args)
    {
        string path = File.GetPath(File.PATH_DOCUMENTS) + "/temp.txt";

        //Create a new file
        if (!File.CreateFile(path))
        {
            Console.WriteLine("Failed to write file.");
            return;
        }

        //Rename the file
        var dst = File.ExtractDir(path) + "/temp2.txt";
        File.DeleteFile(dst);
        if (!File.RenameFile(path, dst))
        {
            Console.WriteLine("Failed to rename file.");
        }

        File.OpenDir(dst);
    }
}
```