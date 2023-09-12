# Terrain:GetTileHidden

This method is used to check if a single terrain tile is visible.

## Syntax

- **GetTileHidden**(x: number, y: number): boolean
- **GetTileHidden**(coord: iVec2): boolean

### Parameters

- **coord**: (x: number, y: number) - The tile coordinate.

## Returns

Returns true if the tile is hidden, otherwise false is returned.

## Example

```lua
local terrain = Terrain()

-- Using x, y coordinates
local x = 10
local y = 5
local isHidden = terrain:GetTileHidden(x, y)
print("Tile (" .. x .. ", " .. y .. ") is hidden: " .. tostring(isHidden))

-- Using iVec2 coordinate
local coord = iVec2(15, 8)
isHidden = terrain:GetTileHidden(coord)
print("Tile (" .. coord.x .. ", " .. coord.y .. ") is hidden: " .. tostring(isHidden))
```