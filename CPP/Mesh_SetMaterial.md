# Mesh::SetMaterial

This method sets the mesh material.

## Syntax 

- void **SetMaterial**(shared_ptr<[Material](Material.md)> material, const int index = 0)

| Parameter | Description |
|---|---|
| material | mesh material to set, or NULL for no material |
| index | mesh material index to set, between 0 and 3 |

## Remarks

Each mesh can have up to four materials applied. Materials are blended with vertex material weights.
