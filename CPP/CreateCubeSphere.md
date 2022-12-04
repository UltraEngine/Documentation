# CreateCubeSphere

This function creates a new sphere model using a segmented cube morphed into a spherical shape, with a physics collider.

## Syntax

- shared_ptr<[Model](Model.md)> **CreateCubeSphere**(shared_ptr<[World](World.md)> world, const float radius = 0.5, const int segments = 8, const MeshPrimtives type = MESH_TRIANGLES)

| Parameter | Description |
|--|--|
| world | world to create the mdoel in |
| radius | cylinder radius |
| segments | subdivisions for each face |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Returns 

Returns a new model.
