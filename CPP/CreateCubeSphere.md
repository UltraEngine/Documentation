# CreateCubeSphere

This function creates a new sphere model using a segmented cube morphed into a spherical shape, with a physics collider.

## Syntax

- shared_ptr<[Model](Model.md)> **CreateCubeSphere**(shared_ptr<[World](World.md)> world, const float radius = 0.5, const int segments = 8, const bool quads = false)

| Parameter | Description |
|--|--|
| world | world to create the mdoel in |
| radius | cylinder radius |
| segments | subdivisions for each face |
| quads | if set to true the mesh will be made of quads, otherwise it will use triangles |

## Returns 

Returns a new model.
