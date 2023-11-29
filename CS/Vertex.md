# Vertex

Base class: [Object](Object.md)

This class stores properties for a single mesh vertex.

| Property | Type | Description |
|---|---|---|
| bitangent | [Vec3](Vec3.md) | vertex bitangent |
| boneindices | byte[] | vertex bone indices, for skinned animation |
| boneweights | [Vec4](Vec4.md) | vertex bone weights, for skinned animation |
| displacement | float | maximum displacement, for use with tessellation |
| normal | [Vec3](Vec3.md) | vertex normal |
| position | [Vec3](Vec3.md) | vertex position |
| texcoords | [Vec4](Vec4.md) | vertex texcoords |
| tangent | [Vec3](Vec3.md) | vertex tangent |

```csharp
using UnityEngine;

public class Vertex : Object
{
    public Vec3 bitangent;
    public byte[] boneindices;
    public Vec4 boneweights;
    public float displacement;
    public Vec3 normal;
    public Vec3 position;
    public Vec4 texcoords;
    public Vec3 tangent;
}
```