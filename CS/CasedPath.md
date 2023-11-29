# CasedPath

This function returns a file path with capitalization fixed to match the existing file on the hard drive. It will also convert backslashes to forward slashes. The specified file must exist.

## Syntax
- [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string) **CasedPath**(string path)

| Parameter | Description |
|----|---|
| path | file path to correct |

## Returns
Returns the file path with corrected capitalization.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string path = GetCurrentDir();

        //Convert to lowercase
        path = path.ToLower();
        Console.WriteLine("Lowercase path: ");
        Console.WriteLine(path);
        Console.WriteLine();

        //Correct case
        path = CasedPath(path);
        Console.WriteLine("Corrected path: ");
        Console.WriteLine(path);
    }
}
```