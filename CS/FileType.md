# FileType

This function detects the type of a specified file path.

## Syntax

- int **FileType**(WString path, bool packages = true)

| Parameter | Description |
| --- | --- |
| path | file path to read |
| packages | if true then any loaded packages will be checked after the file system |

## Returns

Returns 1 if the specified path is a file, 2 if it is a folder, or 0 if it does not exist.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = CurrentDir();

        var dir = LoadDir(path);
        if (path == "") path = ".";
        foreach (string file in dir)
        {
            Print("Name: " + file);

            if (path != "") file = path + "/" + file;

            Print("Type: " + FileType(file).ToString());
            Print("Time: " + FileTime(file).ToString());
            Print("Size: " + FileSize(file).ToString());
            Print("Hidden: " + FileHidden(file).ToString());

            Print("");
        }
    }
}
```