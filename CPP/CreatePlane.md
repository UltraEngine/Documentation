# CreatePlane

This function creates a new model consisting of a single rectangle.

## Syntax

- shared_ptr<[Model](Model.md)> **CreatePlane**(shared_ptr<[World](World.md)/> world, const float width = 1, const float height = 1, const int xsegs= 1, const int ysegs = 1, const bool quads = false)

| Parameter | Description |
|---|---|
| world | world to create the model in |
| width, height | plane dimensions |
| xsegs, ysegs | mesh subdivision |
| quads | if true the mesh will be made of quad primitives, otherwise triangles will be used |

## Returns

Returns a new model.
