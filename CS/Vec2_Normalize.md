# Vec2.Normalize

This method returns the normalized vector. The resulting vector will have a length of one.

## Syntax

- [Vec2](Vec2) **Normalize**()

## Returns

Returns the normalized vector. If the magnitude of this vector is zero, a vector with zero length will be returned.

## Example

```csharp
using System;
using UltraEngine;

public class Program
{
    public static void Main(string[] args)
    {
        Vec2 v = new Vec2(3, 5);
        v = v.Normalize();
        Console.WriteLine(v.x + ", " + v.y);
    }
}
```