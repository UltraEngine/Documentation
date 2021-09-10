# Mesh

**Base class:** [Object](Object.md)

The mesh class is a collection of vertices and polygons that are visible in the 3D world.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| indices | vector<uint32_t\> | Array of polygon indices. |
| material | shared_ptr<[Material](Material.md)\>& | Read-only material object. |
| vertices | vector<[Vertex](Vertex)\> | Array of mesh vertices. |
| [AddVertex](AddVertex.md) | Method | Adds a new vertex to the mesh. |
| [AddPolygon](AddPolygon.md) | Method | Adds a new polygon to the mesh. |
| [Finalize](Finalize.md) | Method | Sends the mesh data to the rendering thread. |
| [CreateMesh](CreateMesh.md) | Function | Creates a new mesh object. |
