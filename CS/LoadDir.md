# LoadDir

This function loads the contents of a directory and returns an array of files.

## Syntax

- List<[string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string)> **LoadDir**(string path, bool packages = true)

| Parameter | Description |
|---|---|
| path | file path to load |
| packages | if true any loaded packages will be checked for the specified folder after the file system |

## Returns

Returns a List of file names found within the directory. The List will be empty if the specified path contains no files, or if the folder contains no files.
 
 ## Example

```csharp
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

            Print("Type: " + String(FileType(file)));
            Print("Time: " + String(FileTime(file)));
            Print("Size: " + String(FileSize(file)));
            Print("Hidden: " + String(FileHidden(file)));

            Print("");
        }
    }
}
```