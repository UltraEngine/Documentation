# Vertex

This class stores properties for a single mesh vertex.

## Properties

| Name | Type | Description |
|---|---|---|
| position | [Vec3](Vec3.md) | vertex position |
| normal | [Vec3](Vec3.md) | vertex normal |
| texcoords | [Vec2](Vec2.md) | vertex texcoords |
| tangent | [Vec3](Vec3.md) | vertex tangent |
| bitangent | [Vec3](Vec3.md) | vertex bitangent |
| displacement | float | maximum displacement, for use with tessellation |
| boneweights | [Vec4](Vec4.md) | vertex bone weights, for skinned animation |
| boneindices | array<unsigned char, 4> | vertex bone indices, for skinned animation |
