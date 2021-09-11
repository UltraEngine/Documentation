# Mesh

**Base class:** [Object](Object.md)

The mesh class is a collection of vertices and polygons that are visible in the 3D world.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| indices | vector<uint32_t\> | array of polygon indices |
| material | shared_ptr<[Material](Material.md)\>& | read-only material object |
| vertices | vector<[Vertex](Vertex)\> | array of mesh vertices |
| [AddVertex](Mesh_AddVertex.md) | Method | adds a new vertex to the mesh |
| [AddPolygon](Mesh_AddPolygon.md) | Method | adds a new polygon to the mesh |
| [Finalize](Mesh_Finalize.md) | Method | sends the mesh data to the rendering thread |
| [SetMaterial](Mesh_SetMaterial.md) | Method | sets the mesh material |
| [SetVertexPosition](Mesh_SetVertexPosition) | Method | sets the position of a single vertex |
| [SetVertexNormal](Mesh_SetVertezNormal) | Method | sets the position of a single vertex |
| [SetVertexTexCoords](Mesh_SetVertexTexCoords) | Method | sets the texture coordinates of a single vertex |
| [SetVertexDisplacement](Mesh_SetVertexDisplacement) | Method | sets the displacement of a single vertex |
| [CreateMesh](Mesh_CreateMesh.md) | Function | creates a new mesh object |
