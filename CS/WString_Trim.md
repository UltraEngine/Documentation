# WString.Trim

This method removes whitespace characters from the beginning and end of the wide string and returns the result.

## Syntax

- [WString](WString) **Trim**()

## Returns

Returns the string with whitespace characters removed from the beginning and end.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "    Hello!  ";
        Console.WriteLine("\"" + s.Trim() + "\"");
    }
}
```