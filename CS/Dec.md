# Dec

This function converts a hexadecimal value into a decimal number and returns the result.

## Syntax

- uint64_t **Dec**(string hex)

| Parameter | Description |
| --- | --- |
| hex | hexadecimal number |

## Returns

Returns a string containing the decimal number.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        int i = 1024;
        string s = Hex(i);
        Console.WriteLine(s);
        Console.WriteLine(Dec(s));
    }
}
```