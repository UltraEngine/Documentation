# Vec2.Length

This method returns the length of the vector.

## Syntax

- float **Length**()

## Returns

Returns the length of the vector.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Vec2 v = new Vec2(3, 5);
        Console.WriteLine(v.Length());

        return 0;
    }
}
```