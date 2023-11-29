# PickInfo

This class contains information from the results of a ray cast.

| Property | Type | Description |
| -------- | ---- | ----------- |
| entity | [Entity](Entity.md) | picked entity |
| face | [Face](Face.md) | picked face, for brushes |
| mesh | [Mesh](Mesh.md) | picked mesh, for models |
| normal | [Vec3](Vec3.md) | picked normal |
| polygon | uint | picked polygon, for models |
| position | [Vec3](Vec3.md) | picked position |
| success | bool | true if anything is hit or false for nothing hit |
| texcoords | [Vec2](Vec2.md)[] | picked texture coordinates, for brushes or models |

## Example

**C++**
```cpp
PickInfo pickInfo;

if (engine.Raycast(ray, pickInfo))
{
    // Check if anything was hit
    if (pickInfo.success)
    {
        // Do something with the picked info
    }
}
```

**C#**
```csharp
PickInfo pickInfo;

if (engine.Raycast(ray, out pickInfo))
{
    // Check if anything was hit
    if (pickInfo.success)
    {
        // Do something with the picked info
    }
}
```