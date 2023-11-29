# RequestDir #
This function displays a file dialog and lets the user select a folder.

## Syntax ##
- [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string) **RequestDir**(const [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string)& title = "Open Folder", const [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string)& dir = "");

## Example

![](https://github.com/Leadwerks/Documentation/raw/master/Images/RequestDir.png)

```csharp
using System;

class Program
{
    static void Main()
    {
        string file = RequestDir("Open Folder");
        Console.WriteLine(file);
    }
}
```