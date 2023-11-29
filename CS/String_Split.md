# String.Split
This method splits the string by a delimiter and returns an array of parts.

## Syntax

```csharp
string[] Split(string delimiter)
```

| Parameters | Description |
|---|---|
| delimiter | string separator |

## Returns

Returns an array of string parts.

## Remarks

If the delimiter is not found in the string, the entire string will be returned. If the delimiter is an empty string, all whitespace characters will be used to split the string.

## Example

```csharp
using System;

class Program 
{
    static void Main(string[] args)
    {
        string s = "dog,cat,raccoon,fox,crow,snake,rabbit,deer";
        string[] sarr = s.Split(",");

        foreach (string str in sarr)
        {
            Console.WriteLine(str);
        }
    }
}
```