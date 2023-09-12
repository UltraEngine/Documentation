# CreateCubeSphere

This function creates a new sphere model using a segmented cube morphed into a spherical shape, with a physics collider.

## Syntax

`function CreateCubeSphere(world: World, radius: number = 0.5, segments: number = 8, type: MeshPrimtives = MESH_TRIANGLES): Model`

### Parameters

| Parameter | Description |
|--|--|
| world | The world to create the model in |
| radius | The radius of the cylinder |
| segments | The subdivisions for each face |
| type | The type of mesh, can be `MESH_TRIANGLES` or `MESH_QUADS` |

## Returns 

Returns a new model.