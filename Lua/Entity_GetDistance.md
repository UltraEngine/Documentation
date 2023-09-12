# Entity:GetDistance

This method is used to calculate the distance in meters to another entity or to a point in global space.

## Syntax

```lua
function Entity:GetDistance(entity)
```

```lua
function Entity:GetDistance(point)
```

```lua
function Entity:GetDistance(x, y, z)
```

## Parameters

- `entity`: The entity to return the distance to.
- `point, (x, y, z)`: The position in global space to return the distance to.

## Returns

Returns the distance to the specified entity or point, in meters.