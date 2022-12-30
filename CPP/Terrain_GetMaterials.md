# Terrain::GetMaterials

This method gets all the materials in use on the terrain at the specified coordinate.

## Syntax

std::vector<shared_ptr<[Material](Material.md)> > **GetMaterials**(const int x, const int y)

| Parameter | Description |
|---|---|
| x, y | terrain coordinate |

## Returns

Returns an array containing all the materials in use at the specified point.
