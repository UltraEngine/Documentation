# String.GetSize #
This method returns the number of characters in the string.

## Syntax ##
- **int** **GetSize**()

## Returns ##
Returns the number of characters in the string.

## Example ##
```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        string s = "Hello, how are you today?";
        Console.WriteLine(s.Length);

        Console.ReadLine();
    }
}
```