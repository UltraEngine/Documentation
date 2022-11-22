# CreateBox

This function creates a new box model with a physics collider.

## Syntax

- shared_ptr<[Model](Model.md)\> **CreateBox**(shared_ptr<[World](World.md)\> world, const float size = 1)
- shared_ptr<[Model](Model.md)\> **CreateBox**(shared_ptr<[World](World.md)\> world, const float width, const float height, const float depth, const int xsegs = 1, const int ysegs = 1, const int zsegs = 1, const bool quads = false))

| Parameter | Description |
|---|---|
| world | world to create the model in |
| size, (width, height, depth) | uniform size or dimensions of the box |
| xsegs, ysegs, zsegs | number of segments on each axis |
| quads | if true the mesh will use quads, otherwise it will use triangles |

## Remarks

For materials that use tessellation, set the *quad* parameter to true.

## Returns

Returns a new model.
