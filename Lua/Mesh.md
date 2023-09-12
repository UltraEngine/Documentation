# Mesh

**Base class:** [Object](Object.md)

The mesh class is a collection of vertices and polygons that form visible surfaces.

### Properties

| Property   | Type                                | Description                                   |
| ---------- | ----------------------------------- | --------------------------------------------- |
| bounds     | const [Aabb](Aabb.md)&              | read-only mesh bounding box                    |
| extra      | shared_ptr<Object>                  | user-defined data                              |
| indices    | const vector<uint32_t>&             | read-only array of primitive indices           |
| material   | const shared_ptr<Material>&         | read-only material object                      |
| name       | [WString](WString.md)               | user-defined name                              |
| primitives | const vector<Primitive>&            | read-only array of mesh primitives             |
| type       | const MeshPrimitives&               | read-only mesh primitive type                  |
| vertices   | const vector<Vertex>&               | read-only array of mesh vertices               |

### Methods

| Method                          | Description                                          |
| ------------------------------- | ---------------------------------------------------- |
| [AddPrimitive](Mesh_AddPrimitive.md) | adds a new polygon to the mesh                       |
| [AddVertex](Mesh_AddVertex.md)  | adds a new vertex to the mesh                         |
| [Copy](Mesh_Copy.md)            | makes a copy of the mesh                              |
| [CountPrimitives](Mesh_CountPrimitives.md) | returns the number of mesh primitives         |
| [CountVertices](Mesh_CountVertices.md) | returns the number of mesh vertices                 |
| [GetPrimitiveAttributes](Mesh_GetPrimitiveAttributes.md) | gets attributes of a single primitive  |
| [GetRenderLayers](Mesh_GetRenderLayers.md) | gets the mesh render layers                          |
| [GetVertexColor](Mesh_GetVertexColor.md) | gets the color of a vertex                           |
| [GetVertexPosition](Mesh_GetVertexPosition.md) | gets the position of a vertex                 |
| [GetVertexNormal](Mesh_GetVertexNormal.md) | gets the normal of a vertex                          |
| [GetVertexTexCoords](Mesh_GetVertexTexCoords.md) | gets the texture coordinates of a vertex   |
| [Modify](Mesh_Modify.md)        | batch modify vertices and indices                     |
| [Recenter](Mesh_Recenter.md)    | recenters a mesh along one or more axes               |
| [Rotate](Mesh_Rotate.md)        | rotates a mesh                                       |
| [Scale](Mesh_Scale.md)          | scales a mesh                                        |
| [SetMaterial](Mesh_SetMaterial.md) | sets the mesh material                              |
| [SetPrimitiveAttributes](Mesh_SetPrimitiveAttributes.md) | sets attributes of a single primitive |
| [SetRenderLayers](Mesh_SetRenderLayers.md) | sets the mesh render layers                     |
| [SetSkinned](Mesh_SetSkinned.md) | enables or disables mesh skinning                     |
| [SetVertexColor](Mesh_SetVertexColor.md) | sets the position of a vertex                    |
| [SetVertexPosition](Mesh_SetVertexPosition.md) | sets the position of a vertex              |
| [SetVertexNormal](Mesh_SetVertexNormal.md) | sets the normal of a vertex                       |
| [SetVertexTexCoords](Mesh_SetVertexTexCoords.md) | sets the texture coordinates of one vertex |
| [Transform](Mesh_Transform.md)  | transforms a mesh                                    |
| [Translate](Mesh_Translate.md)  | translates a mesh                                    |
| [UpdateBounds](Mesh_UpdateBounds.md) | updates the mesh bounding box                  |
| [UpdateNormals](Mesh_UpdateNormals.md) | calculates new mesh normals                   |
| [UpdateTangents](Mesh_UpdateTangents.md) | updates the mesh tangents                      |

### Functions

| Function                        | Description                             |
| ------------------------------- | --------------------------------------- |
| [CreateMesh](CreateMesh.md)      | creates a new mesh object                |

# Example

```lua
-- Create a new mesh object
local mesh = CreateMesh()

-- Add a new vertex to the mesh
mesh:AddVertex(Vertex(0, 0, 0))

-- Add a new primitive to the mesh
local indices = {0}
mesh:AddPrimitive(Primitive(indices))

-- Get the position of a vertex
local position = mesh:GetVertexPosition(0)

-- Set the position of a vertex
mesh:SetVertexPosition(0, Vector(1, 0, 0))
```