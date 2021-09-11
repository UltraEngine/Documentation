# Mesh

**Base class:** [Object](Object.md)

The mesh class is a collection of vertices and polygons that form visible surfaces.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| bounds | const [AABB](AABB.md)& | read-only mesh bounding box |
| indices | vector<uint32_t\> | array of polygon indices |
| material | shared_ptr<[Material](Material.md)\>& | read-only material object |
| vertices | vector<[Vertex](Vertex.md)\> | array of mesh vertices |
| [AddVertex](Mesh_AddVertex.md) | Method | adds a new vertex to the mesh |
| [AddPolygon](Mesh_AddPolygon.md) | Method | adds a new polygon to the mesh |
| [Copy](Mesh_Copy.md) | Method | |
| [Finalize](Mesh_Finalize.md) | Method | sends the mesh data to the rendering thread |
| [Recenter](Mesh_Recenter.md) | Method | |
| [Rotate](Mesh_Rotate.md) | Method | |
| [Scale](Mesh_Scale.md) | Method | |
| [SetMaterial](Mesh_SetMaterial.md) | Method | sets the mesh material |
| [Translate](Mesh_Translate.md) | Method | |
| [Transform](Mesh_Transform.md) | Method | |
| [UpdateBounds](Mesh_UpdateBounds.md) | Method | |
| [UpdateTangents](Mesh_UpdateTangents.md) | Method | |
| [CreateMesh](CreateMesh.md) | Function | creates a new mesh object |
