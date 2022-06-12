# Mesh::UpdateTessellation

This method attempts to automatically construct tessellation normals for the model. You must call [Mesh::Finalize](Mesh_Finalize.md) after calling this method before any changes will be visible.

## Syntax

- void **UpdateTessellation**(const float tolerance = 0.01f)

| Parameter | Description |
|---|---|
| tolerance | linear distance tolerance for matching primitive edges |

## Example

```c++
auto model = CreateBox(world, 2, 10, 2, 1, 8, 1, true);

auto piv = CreatePivot(NULL);
piv->SetPosition(10, 0, 0);

for (auto mesh : model->lods[0]->meshes)
{
    for (auto& vertex : mesh->vertices)
    {
        vertex.position.y += 5.0f;
        float a = -180.0f * (vertex.position.y / 10.0f);
        piv->SetRotation(0,0,0);
        vertex.position.y = 0.0f;
        vertex.position = TransformPoint(vertex.position, model, piv);
        piv->SetRotation(0, 0, a);
        vertex.position = TransformPoint(vertex.position, piv, model);
        vertex.normal = TransformNormal(vertex.normal, piv, model);
        vertex.tangent = TransformNormal(vertex.tangent, piv, model);
        vertex.bitangent = TransformNormal(vertex.bitangent, piv, model);
    }
    mesh->UpdateTessellation();
    mesh->Finalize();
    model->UpdateBounds();
}
```
