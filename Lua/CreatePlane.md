### createPlane

This function creates a new model consisting of a single rectangle.

#### Syntax

`function createPlane(world: Model, width: number, height: number, xsegs: number, ysegs: number, type: number): Model`

| Parameter | Description |
|---|---|
| world | world to create the model in |
| width, height | plane dimensions |
| xsegs, ysegs | mesh subdivision |
| type | can be MESH_TRIANGLES or MESH_QUADS |

#### Returns

Returns a new model.