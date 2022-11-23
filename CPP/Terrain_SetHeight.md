# Terrain::SetHeight

This method sets a terrain point's height. The height value will be clamped between 0.0 and 1.0.

## Syntax

- void **SetHeight**(const [iVec2](iVec2.md)& coord, const float height)
- void **SetHeight**(const int x, const int y, const float height)

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coorinate |
| height | height to set |
