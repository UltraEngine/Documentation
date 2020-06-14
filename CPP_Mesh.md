# Mesh #

The mesh class is a collection of vertices and polygons that are visible in the 3D world.

## Members ##

| Name | Type | Description |
| --- | --- | --- |
| **vertices** | vector<[Vertex](CPP_Vertex)\> | Array of mesh vertices. |
| **indices** | vector<uint32_t\> | Array of polygon indices. |
| **material** | shared_ptr<[Material](API_Material.md)\>& | Read-only material object. |

## Methods ##

| Name | Description |
| --- | --- |
| [AddVertex](API_AddVertex.md) | Adds a new vertex to the mesh. |
| [AddPolygon](API_AddPolygon.md) | Adds a new polygon to the mesh. |
| [Finalize](API_Finalize.md) | Sends the mesh data to the rendering thread. |

## Functions ##

| Name | Description |
| --- | --- |
| [CreateMesh](API_CreateMesh.md) | Creates a new mesh object. |
