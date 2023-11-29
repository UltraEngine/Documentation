# String::Right #
This method returns the rightmost characters of the string.

## Syntax ##
- [String](String.md) **Right**(int count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns ##
Returns the rightmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example ##
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string s = "Hello, how are you today?";
        Console.WriteLine(s.Right(6));
    }
}
```