# Mesh #
The mesh class is a collection of vertices and polygons that are visible in the 3D world.

## Members ##
| Name | Type | Description |
| --- | --- | --- |
| **vertices** | vector<[Vertex](CPP_Vertex)\> | |
| **indices** | vector<uint32_t\> |  |
| **material** | shared_ptr<[Material](API_Material.md)\>& | Read-only material object |

## Methods ##
- AddVertex
- AddPolygon
- Finalize

## Functions ##
- CreateMesh
