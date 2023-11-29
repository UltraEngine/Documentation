# String.Left #
This method returns the leftmost characters of the string.

## Syntax ##
- [string](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=net-6.0) **Left**(int count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns ##
Returns the leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example ##
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string s = "Hello, how are you today?";
        Console.WriteLine(s.Left(5));
    }
}
```