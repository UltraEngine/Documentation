# Terrain::SetHeight

This method sets a terrain point's height. The height value will be clamped between 0.0 and 1.0.

## Syntax

- void **SetHeight**(const [iVec2](iVec2.md)& coord, const float height)
- void **SetHeight**(const int x, const int y, const float height)

| Parameter | Description |
|---|---|
| coord | terrain coorinate to modify |
| x | x component of the terrain coordinate |
| y | y component of the terrain coordinage |
| height | height to set |
