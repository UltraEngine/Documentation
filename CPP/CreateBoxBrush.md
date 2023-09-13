# CreateBoxBrush

This function creates a brush with a box shape.

## Syntax

- shared_ptr<[Brush](Brush.md)\> **CreateBrush**(shared_ptr<[World](World.md)\> world)
- shared_ptr<[Brush](Brush.md)\> **CreateBrush**(shared_ptr<[World](World.md)\> world, float width, float height, float depth)
- 
| Parameter | Description |
|---|---|
| world | world to create the brush in |
| width, height, depth | dimensions of the box, in meters |

## Returns

Returns a new brush entity.
