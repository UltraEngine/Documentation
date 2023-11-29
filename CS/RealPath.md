# RealPath

This function fixes a file path by adding the complete directory path and replacing backslashes with forward slashes. The file path does not have to specify an existing file.

## Syntax
- [String](https://docs.microsoft.com/en-us/dotnet/api/System.String?view=net-5.0) **RealPath**(string path)

| Parameter | Description |
|---|---|
| path | file path to correct |

## Returns
Returns the corrected file path.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string path = "..\\./temp.txt";
        Console.WriteLine(RealPath(path));
    }
}
```