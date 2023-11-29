# CurrentDir #
This function returns the path of current folder.

## Syntax ##
- [string](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/string) **CurrentDir**()

## Returns ##
Returns the current folder location.

## Example
```csharp
using System;

namespace GameEngineExample
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(CurrentDir());
        }
    }
}
```