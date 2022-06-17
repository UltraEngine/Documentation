# Mesh

The mesh class is a collection of vertices and polygons that form visible surfaces.

**Base class:** [Object](Object.md)


## Properties

| Name | Type | Description |
| --- | --- | --- |
| bounds | [AABB](AABB.md) | read-only mesh bounding box |
| indices | vector<uint32_t\> | read-only array of primitive indices |
| material | shared_ptr<[Material](Material.md)\>& | read-only material object |
| vertices | vector<[Vertex](Vertex.md)\> | read-only array of mesh vertices |
| [AddPrimitive](Mesh_AddPrimitive.md) | Method | adds a new polygon to the mesh |
| [AddVertex](Mesh_AddVertex.md) | Method | adds a new vertex to the mesh |
| [Copy](Mesh_Copy.md) | Method | |
| [CountPolygons](Mesh_CountPolygons.md) | Method | |
| [Finalize](Mesh_Finalize.md) | Method | sends the mesh data to the rendering thread |
| [Recenter](Mesh_Recenter.md) | Method | |
| [Rotate](Mesh_Rotate.md) | Method | |
| [Scale](Mesh_Scale.md) | Method | |
| [SetMaterial](Mesh_SetMaterial.md) | Method | sets the mesh material |
| [Transform](Mesh_Transform.md) | Method | |
| [Translate](Mesh_Translate.md) | Method | |
| [UpdateBounds](Mesh_UpdateBounds.md) | Method | |
| [UpdateNormals](Mesh_UpdateNormals.md) | Method | |
| [UpdateTangents](Mesh_UpdateTangents.md) | Method |  |
| [UpdateTessellation](Mesh_UpdateTessellation.md) | Method | |
| [Validate](Mesh_Validate.md) | Method | checks the mesh for errors |
| [CreateMesh](CreateMesh.md) | Function | creates a new mesh object |
