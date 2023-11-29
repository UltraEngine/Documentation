# Vec3.DistanceToPoint

This method returns the distance between this point and the specified position.

## Syntax

- [Vec3](Vec3.md) **DistanceToPoint**(Vec3 position)

| Parameter | Description |
|-|-|
|position|position to return the distance to.|

## Returns

Returns the distance between this point and the specified position.

## Example

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Vec3 v0 = new Vec3(0, 0, 0);
        Vec3 v1 = new Vec3(1000, 1000, 0);

        Console.WriteLine(v0.DistanceToPoint(v1));
    }
}
```