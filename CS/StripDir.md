# StripDir #
This function removes the folder part from a file path and returns the result.

## Syntax ##
- [string](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=net-5.0) **StripDir**(string path)

| Parameter | Description |
| --- | --- |
| path | full file path |

## Returns ##
Returns the file path with the folder removed.

## Example
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string path = "C:/Windows/explorer.exe";

        Console.WriteLine("Full path: " + path);
        Console.WriteLine("File name: " + StripDir(path));
        Console.WriteLine("File directory: " + ExtractDir(path));
        Console.WriteLine("File extension: " + ExtractExt(path));  
        Console.WriteLine("File name without extension: " + StripAll(path));
        Console.WriteLine("File path without extension: " + StripExt(path));
    }

    static string StripDir(string path)
    {
        // Implementation of StripDir
    }

    // Other functions

    static string ExtractDir(string path)
    {
        // Implementation of ExtractDir
    }

    static string ExtractExt(string path)
    {
        // Implementation of ExtractExt
    }

    static string StripAll(string path)
    {
        // Implementation of StripAll
    }

    static string StripExt(string path)
    {
        // Implementation of StripExt
    }
}
```