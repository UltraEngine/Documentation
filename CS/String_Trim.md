# String.Trim #

This method removes whitespace characters from the beginning and end of the string and returns the result.

## Syntax ##

- [string](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=net-5.0) **Trim**()

## Returns ##

Returns the string with whitespace characters removed from the beginning and end.

## Example ##

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string s = "    Hello!  ";
        Console.WriteLine("\"" + s.Trim() + "\"");
    }
}
```