# FileTime

This function returns the last time a file at the specified path was created or modified.

## Syntax

- ulong **FileTime**(string path, bool packages = true)

| Parameter | Description |
| --- | --- |
| path | file path to read |
| packages | if true loaded packages will be checked after the file system |

## Returns

Returns the file time, in units of 100 nanosecond intervals that have elapsed since since 12:00 A.M. January 1, 1601 Coordinated Universal Time (UTC). If the file does not exist then zero is returned.

## Example
```csharp
using System;
using UEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = UltraEngine.CurrentDir();

        UltraEngine.LoadDir(dir, path);
        if (path == "") path = ".";
        foreach (string file in dir)
        {
            Console.WriteLine("Name: " + file);

            if (path != "") file = path + "/" + file;

            Console.WriteLine("Type: " + UltraEngine.FileType(file));
            Console.WriteLine("Time: " + UltraEngine.FileTime(file));
            Console.WriteLine("Size: " + UltraEngine.FileSize(file));
            Console.WriteLine("Hidden: " + UltraEngine.FileHidden(file));

            Console.WriteLine("");
        }
    }
}
```