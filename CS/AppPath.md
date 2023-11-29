# AppPath

This function returns the path of the application executable.

## Syntax

- [string](https://docs.microsoft.com/en-us/dotnet/api/system.string) **AppPath**()

## Returns

Returns the path of the launched executable.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(AppPath());
    }
}
```