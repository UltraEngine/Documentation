# Face::SetMaterial

This method applies a material to a face.

## Syntax

- void **SetMaterial**(shared_ptr<[Material](Material.md)/> material)

| Parameter | Description |
|---|---|
| material | material to assign |

## Remarks

You must call [Brush::Build](Brush_Build.md) before the material will appear on the visible mesh.
