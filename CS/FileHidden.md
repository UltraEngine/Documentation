# FileHidden #
This function returns the hide state of the specified file path.

## Syntax ##
- bool **FileHidden**(string path)

## Returns ##
Returns true of the file exists and is hidden, otherwise false is returned.

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        string path = Environment.CurrentDirectory;

        var dir = DirUtils.LoadDir(path);
        if (path == "") path = ".";
        foreach (var file in dir)
        {
            Console.WriteLine("Name: " + file);

            if (path != "") file = path + "/" + file;

            Console.WriteLine("Type: " + FileType.Get(file).ToString());
            Console.WriteLine("Time: " + FileTime.Get(file).ToString());
            Console.WriteLine("Size: " + FileSize.Get(file).ToString());
            Console.WriteLine("Hidden: " + FileHidden.Get(file).ToString());

            Console.WriteLine("");
        }
    }
}
```