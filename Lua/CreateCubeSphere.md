# CreateCubeSphere

This function creates a new sphere model using a segmented cube morphed into a spherical shape, with a physics collider.

## Syntax

- [Model](Model.md) **CreateCubeSphere**([World](World.md) world, number radius = 0.5, number segments = 8, number type = MESH_TRIANGLES)

| Parameter | Description |
|--|--|
| world | world to create the mdoel in |
| radius | cylinder radius |
| segments | subdivisions for each face |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Returns 

Returns a new model.
