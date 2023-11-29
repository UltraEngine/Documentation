# Vec3.Length

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
        Vec3 v = new Vec3(1, 1, 0);
        Console.WriteLine(v.Length());
    }
}
```