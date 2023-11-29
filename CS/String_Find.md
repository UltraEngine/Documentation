# String.Find #
This method performs a search for the specified term.

## Syntax ##
- int **Find**(string token)

| Parameter | Description |
| --- | --- |
| token | search term to find |

## Returns ##
Returns the first position in the string where the search term is found, or -1 if it is not found.

## Example ##
```csharp
using System;

namespace GameEngineAPI
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "Hello, how are you today?";
            Console.WriteLine(s.Find("today"));

            Console.ReadLine();
        }
    }
}
```