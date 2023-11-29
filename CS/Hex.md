# Hex

This function converts a decimal value into a hexadecimal number and returns the result.

## Syntax

- [String](String.md) **Hex**(uint64 dec)

| Parameter | Description |
| --- | --- |
| dec | decimal number |

## Returns

Returns a string containing the hexadecimal number.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        ulong i = 1024;
        string s = Hex(i);
        Console.WriteLine(s);
        Console.WriteLine(Dec(s));
    }
}
```