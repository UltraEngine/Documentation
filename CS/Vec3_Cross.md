# Vec3.Cross

This method returns the cross product of this vector and the specified vector.

## Syntax

- [Vec3](Vec3.md) **Cross**(const [Vec3](Vec3.md)& v)

| Parameter | Description |
|-|-|
|v|vector to return the cross product of.|

## Returns

Returns the cross product of this vector and the specified vector.

## Remarks

The cross product calculates a vector that is perpindicular to both input vectors. If both vectors are the same this method will return a vector with a length of zero.

## Example

```csharp
using System;
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        Vec3 v0 = new Vec3(1, 0, 0);
        Vec3 v1 = new Vec3(0, 1, 0);
        Vec3 v2 = v0.Cross(v1);

        Console.WriteLine(v2.x + ", " + v2.y + ", " + v2.z);
    }
}
```
