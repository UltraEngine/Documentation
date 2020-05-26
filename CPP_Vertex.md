# Vertex #
The vertex structure stored properties for a single vertex in a mesh.

## Members ##
- Vec3 position
- float displacement
- array<unsigned char, 3> normal
- array<short, 4> texcoords;
- array<unsigned char, 4> color
- array<unsigned char, 4> tangent
- array<unsigned char, 4> boneweights
- array<unsigned char, 4> boneindices

## Methods ##
- GetColor
- GetNormal
- GetTexCoords
- GetTangent
- SetColor
- SetNormal
- SetTangent
- SetTexCoords
