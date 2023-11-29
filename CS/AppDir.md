# AppDir

This function returns the path of the folder the application executable is in. This will return the executable's folder, even if the program is launched with a different working directory.

## Syntax

- [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string) **AppDir**()

## Returns

Returns the starting folder the application is launched in.

## Example

```csharp
using System;

namespace MyApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(AppDir());
        }
    }
}
```