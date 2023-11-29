# CreateCylinder

This function creates a new cylinder model with a physics collider.

## Syntax

- [Model](Model.md) **CreateCylinder**([World](World.md) world, float radius = 0.5, float height = 1.0, int sides = 16, int heightsegs = 1, int capsegs = 1)

| Parameter | Description |
|--|--|
| world | world to create the model in |
| radius | cylinder radius |
| height | cylinder height |
| sides | number of sides |
| heightsegs | number of segments along the Y axis |
| capsegs | number of end cap subdivisions |

## Returns 

Returns a new model.