# Vertex

This class stores properties for a single mesh vertex. A minimal amount of data is efficiently packed into a small structure in order to maximize speed.

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
| [GetBitangent](Vertex_GetBiTangent.md) | Method | returns the vertex bitangent |
| [GetNormal](Vertex_GetNormal.md) | Method | returns the vertex normal |
| [GetTexCoords](Vertex_GetTexCoords.md) | Method | returns the vertex texture coordinates |
| [GetTangent](Vertex_GetTangent.md) | Method | returns the vertex tangent |
| [SetNormal](Vertex_SetNormal.md) | Method | sets the vertex normal |
| [SetTexCoords](Vertex_SetTexCoords.md) | Method | sets the vertex texture coordinates |
