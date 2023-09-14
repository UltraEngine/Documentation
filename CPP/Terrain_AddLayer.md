# Terrain::AddLayer

This method adds a material layer to the terrain.

## Syntax

- int **AddLayer**(shared_ptr<[Material](Material)\> material)

| Parameter | Description |
|---|---|
| material | material to apply to the terrain |

## Returns

Returns the index of the new layer, or the index to any existing layer that uses the specified material.
