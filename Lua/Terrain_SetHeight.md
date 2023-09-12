# Terrain.SetHeight

This method sets a terrain point's height. The height value will be clamped between 0.0 and 1.0.

## Syntax

```lua
Terrain:SetHeight(coord, height)
Terrain:SetHeight(x, y, height)
```

### Parameters
- `coord` (type: [iVec2](iVec2.md)) - terrain coordinate
- `x` (type: number) - x-coordinate of terrain
- `y` (type: number) - y-coordinate of terrain
- `height` (type: number) - height to set