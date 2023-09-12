# Vertex

## Base class:
[Object](Object.md)

## Description:
This class stores properties for a single mesh vertex.

## Properties:
| Property    | Type                           | Description                              |
|-------------|--------------------------------|------------------------------------------|
| bitangent   | Vec3                           | vertex bitangent                         |
| boneindices | array<unsigned char, 4>        | vertex bone indices, for skinned animation|
| boneweights | Vec4                           | vertex bone weights, for skinned animation|
| displacement| float                          | maximum displacement, for use with tessellation|
| normal      | Vec3                           | vertex normal                            |
| position    | Vec3                           | vertex position                          |
| texcoords   | Vec4                           | vertex texcoords                         |
| tangent     | Vec3                           | vertex tangent                           |

## Example:

```lua
-- Create a new vertex object
local vertex = Vertex()

-- Set properties of the vertex object
vertex.bitangent = Vec3(1, 0, 0)
vertex.boneindices = {1, 2, 3, 4}
vertex.boneweights = Vec4(0.25, 0.25, 0.25, 0.25)
vertex.displacement = 0.5
vertex.normal = Vec3(0, 1, 0)
vertex.position = Vec3(0, 0, 0)
vertex.texcoords = Vec4(0, 0, 1, 1)
vertex.tangent = Vec3(1, 0, 0)
```