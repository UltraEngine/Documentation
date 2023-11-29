# WString::Lower
This method returns the lowercase version of the wide string.

- [WString](WString.md) **Lower**()

## Returns
Returns the string, converted to lowercase.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "John Smith";
        Console.WriteLine(s.Lower());

        return;
    }
}
```