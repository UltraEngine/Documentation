# WString::Upper

This method returns the uppercase version of the wide string.

- [WString](WString.md) **Upper**()

## Returns

Returns the string, converted to uppercase.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "John Smith";
        Console.WriteLine(s.Upper());

        Console.ReadLine();
    }
}
```