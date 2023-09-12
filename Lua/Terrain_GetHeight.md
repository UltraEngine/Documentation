# Terrain:GetHeight

This method gets the height value at the specified coordinate.

## Syntax

`GetHeight(x: int, y: int): table`

`GetHeight(coord: iVec2): table`

Parameter | Description
--------- | -----------
`coord`, `(x, y)` | terrain coordinate

## Returns

Returns the value stored in the heightmap at the specified coordinate.

**Example**

```lua
local terrain = Terrain.new()
local height = terrain:GetHeight(10, 20)
print(height)
```

```lua
local terrain = Terrain.new()
local coord = iVec2.new(10, 20)
local height = terrain:GetHeight(coord)
print(height)
```

Please note that the code above assumes you have already created a `Terrain` object and imported the necessary libraries.