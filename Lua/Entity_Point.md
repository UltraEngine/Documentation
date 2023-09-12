# Entity:Point

This method aligns an axis of the entity to point to another entity or a point in global space.

## Syntax

```lua
function Entity:Point(entity, axis, rate, roll)
```

```lua
function Entity:Point(x, y, z, axis, rate, roll)
```

```lua
function Entity:Point(position, axis, rate, roll)
```

### Parameters

- `entity`: entity to point to
- `position`, `(x, y, z)`: position in space to point to
- `axis`: axis to align (0, 1, or 2)
- `rate`: can be used to gradually align the entity
- `roll`: rotation around the axis

## Example

```lua
-- Point entity2 to entity1
entity2:Point(entity1, 2)

-- Point entity3 to specific position
entity3:Point(10, 0, 5, 1)

-- Point entity4 to position stored in a vector
local position = xVec3(0, 10, 0)
entity4:Point(position, 0, 0.5, 45)
```