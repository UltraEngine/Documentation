# Vertex

This class stores properties for a single mesh vertex.

## Properties

| Name | Type | Description |
|---|---|---|
| position | [Vec3](Vec3.md) | vertex position |
| normal | array<unsigned char, 3> | vertex normal |
| displacement | signed char | vertex displacement, for tessellation |
| texcoords | array<short, 2> | vertex texture coordinates |
| tangent | array<unsigned char, 4> | vertex tangent, for normal mapping |
| boneweights | array<unsigned char, 4> | vertex bone weights, for skinned animation |
| boneindices | array<unsigned char, 4> | vertex bone indices, for skinned animation |
| [SetTexCoords](Vertex_SetTexCoords.md) | Method | sets the vertex texture coordinates |
| GetBitangent | Method | |
| GetNormal | Method | |
| GetTexCoords | Method | |
| GetTangent | Method | |
| SetNormal | Method | |
| SetTangent | Method | |
| SetTexCoords | Method | |
