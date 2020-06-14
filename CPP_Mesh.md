# Mesh #

The mesh class is a collection of vertices and polygons that are visible in the 3D world.

| Property | Type | Description |
| --- | --- | --- |
| **vertices** | vector<[Vertex](CPP_Vertex)\> | Array of mesh vertices. |
| **indices** | vector<uint32_t\> | Array of polygon indices. |
| **material** | shared_ptr<[Material](API_Material.md)\>& | Read-only material object. |
| [AddVertex](API_AddVertex.md) | Method | Adds a new vertex to the mesh. |
| [AddPolygon](API_AddPolygon.md) | Method | Adds a new polygon to the mesh. |
| [Finalize](API_Finalize.md) | Method | Sends the mesh data to the rendering thread. |
| [CreateMesh](API_CreateMesh.md) | Function | Creates a new mesh object. |
