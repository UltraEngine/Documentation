# WString.Mid #
This method extracts a partial string and returns it.

## Syntax ##
- [WString](WString.md) **Mid**(int pos, int length)

| Parameter | Description |
| --- | --- |
| pos | zero-based position in the string to start |
| length | maximum number of characters to return |

## Returns ##
Returns a string extracted from the specified position and length.

## Example

```csharp
using System;

namespace GameEngineApp
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = "Hello, how are you today?";
            Console.WriteLine(s.Mid(7,3));

            Console.ReadLine();
        }
    }
}
```