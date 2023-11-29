# **WString::Left**

This method returns the leftmost characters of the wide string.

## Syntax
- [WString](WString.md) **Left**(int count)

| Parameter | Description |
| --- | --- |
| count | maximum number of characters to return |

## Returns
Returns the leftmost characters of the string. If the count parameter is equal to or greater than the length of the string, the entire string is returned.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        WString s = "Hello, how are you today?";
        Print(s.Left(5));
    }
}
```