# Terrain::SetMaterial

This method sets the terrain material at any point on the heightmap. Up to four materials can be set per point.

## Syntax

- bool **SetMaterial**(const int x, const int y, shared_ptr<[Material](Material.md)> material, const float weight = 1.0f)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)> material, const bool recursive = false)
