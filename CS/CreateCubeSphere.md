## Syntax

- [Model](Model.md) **CreateCubeSphere**([World](World.md) world, float radius = 0.5f, int segments = 8, MeshPrimtives type = MESH_TRIANGLES)

| Parameter | Description |
|--|--|
| world | world to create the model in |
| radius | cylinder radius |
| segments | subdivisions for each face |
| type | can be MESH_TRIANGLES or MESH_QUADS |

## Returns 

Returns a new model.

## Example

```csharp
Model CreateCubeSphere(World world, float radius = 0.5f, int segments = 8, MeshPrimtives type = MESH_TRIANGLES)
{
    // code to create a cube sphere model
    // ...
}

World myWorld = new World();
Model myModel = CreateCubeSphere(myWorld);
```