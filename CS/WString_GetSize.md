# WString.GetSize #

This method returns the number of characters in the wide string.

## Syntax ##
- **int** GetSize()

## Returns ##
Returns the number of characters in the string.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "Hello, how are you today?";
        Console.WriteLine(s.GetSize());

        Console.ReadKey();
    }
}
```