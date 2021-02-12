# Vertex #
This class stores properties for a single mesh vertex.

## Members ##
- [Vec3](Vec3) position
- int materialindex
- array<unsigned char, 3> normal
- signed char displacement
- array<short, 4> texcoords;
- array<unsigned char, 4> color
- array<unsigned char, 4> tangent
- array<unsigned char, 4> boneweights
- array<unsigned char, 4> boneindices

## Methods ##
- GetBitangent
- GetColor
- GetNormal
- GetTexCoords
- GetTangent
- SetColor
- SetNormal
- SetTangent
- SetTexCoords