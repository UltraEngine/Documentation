# Mesh

Base class: [Object](Object.md)

The mesh class is a collection of vertices and polygons that form visible surfaces.

| Property | Type | Description |
| --- | --- | --- |
| bounds | const [Aabb](Aabb.md)& | read-only mesh bounding box |
| extra | shared_ptr<[Object](Object.md)\> | user-defined data |
| indices | const vector<uint32_t\>& | read-only array of primitive indices |
| material | const shared_ptr<[Material](Material.md)\>& | read-only material object |
| materials | const array<shared_ptr<[Material](Material.md)\>, 4>& | read-only materials array |
| name | [WString](WString.md) | user-defined name |
| type | const MeshPrimitives& | read-only mesh primitive type |
| vertices | const vector<[Vertex](Vertex.md)\>& | read-only array of mesh vertices |
| [AddPrimitive](Mesh_AddPrimitive.md) | Method | adds a new polygon to the mesh |
| [AddVertex](Mesh_AddVertex.md) | Method | adds a new vertex to the mesh |
| [Copy](Mesh_Copy.md) | Method | makes a copy of the mesh |
| [CountPrimitives](Mesh_CountPrimitives.md) | Method | returns the number of mesh primitives |
| [CountVertices](Mesh_CountVertices.md) | Method | returns the number of mesh vertices |
| [GetPrimitiveAttributes](Mesh_GetPrimitiveAttributes.md) | Method | gets attributes of a single primitive |
| [GetRenderLayers](Mesh_GetRenderLayers.md) | Method | gets the mesh render layers |
| [GetVertexColor](Mesh_GetVertexColor.md) | Method | gets the color of a vertex |
| [GetVertexPosition](Mesh_GetVertexPosition.md) | Method | gets the position of a vertex |
| [GetVertexNormal](Mesh_GetVertexNormal.md) | Method | gets the normal of a vertex |
| [GetVertexTexCoords](Mesh_GetVertexTexCoords.md) | Method | gets the texture coordinates of a vertex |
| [Modify](Mesh_Modify.md) | Method | batch modify vertices and indices |
| [Recenter](Mesh_Recenter.md) | Method | recenters a mesh along one or more axes |
| [Rotate](Mesh_Rotate.md) | Method | rotates a mesh |
| [Scale](Mesh_Scale.md) | Method | scales a mesh |
| [SetMaterial](Mesh_SetMaterial.md) | Method | sets the mesh material |
| [SetPrimitiveAttributes](Mesh_SetPrimitiveAttributes.md) | Method | sets attributes of a single primitive |
| [SetRenderLayers](Mesh_SetRenderLayers.md) | Method | sets the mesh render layers |
| [SetSkinned](Mesh_SetSkinned.md) | Method | enables or disables mesh skinning |
| [SetVertexColor](Mesh_SetVertexColor.md) | Method | sets the position of a vertex |
| [SetVertexPosition](Mesh_SetVertexPosition.md) | Method | sets the position of a vertex |
| [SetVertexNormal](Mesh_SetVertexNormal.md) | Method | sets the normal of a vertex  |
| [SetVertexTexCoords](Mesh_SetVertexTexCoords.md) | Method | sets the texture coordinates of one vertex |
| [Transform](Mesh_Transform.md) | Method | transforms a mesh |
| [Translate](Mesh_Translate.md) | Method | translates a mesh |
| [UpdateBounds](Mesh_UpdateBounds.md) | Method | updates the mesh bounding box |
| [UpdateNormals](Mesh_UpdateNormals.md) | Method | calculates new mesh normals |
| [UpdateTangents](Mesh_UpdateTangents.md) | Method | updates the mesh tangents |
| [CreateMesh](CreateMesh.md) | Function | creates a new mesh object |
