# WString.Right
This method returns the rightmost characters of the wide string.

## Syntax
- [WString](WString.md) **Right**(int count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns
Returns the rightmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example
```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "Hello, how are you today?";
        Print(s.Right(6));
    }
}
```