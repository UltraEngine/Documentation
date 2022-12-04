# CreatePlane

This function creates a new model consisting of a single rectangle.

## Syntax

- shared_ptr<[Model](Model.md)> **CreatePlane**(shared_ptr<[World](World.md)/> world, const float width = 1, const float height = 1, const int xsegs= 1, const int ysegs = 1, const MeshPrimtives type = MESH_TRIANGLES)

| Parameter | Description |
|---|---|
| world | world to create the model in |
| width, height | plane dimensions |
| xsegs, ysegs | mesh subdivision |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Returns

Returns a new model.
