# Vec3.Inverse

This method returns the inverse of this vector.

## Syntax

- [Vec3](Vec3.md) **Inverse**()

## Returns

Returns the inverse vector.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Vec3 v = new Vec3(1, 2, 3);
        v = v.Inverse();

        Console.WriteLine(v.x + ", " + v.y + ", " + v.z);
    }
}
```