# PickInfo

This class contains information from the results of a ray cast.

## Properties

| Name | Type | Description |
| ---- | ---- | ----------- |
| entity | Entity | Picked entity |
| face | Face | Picked face, for brushes |
| mesh | Mesh | Picked mesh, for models |
| normal | xVec3 | Picked normal |
| polygon | number | Picked polygon, for models |
| position | xVec3 | Picked position |
| success | boolean | `true` if anything is hit, `false` otherwise |
| texcoords | table | Picked texture coordinates, for brushes or models |

### entity

```lua
Entity
```

Picked entity.

### face

```lua
Face
```

Picked face, for brushes.

### mesh

```lua
Mesh
```

Picked mesh, for models.

### normal

```lua
xVec3
```

Picked normal.

### polygon

```lua
number
```

Picked polygon, for models.

### position

```lua
xVec3
```

Picked position.

### success

```lua
boolean
```

`true` if anything is hit, `false` otherwise.

### texcoords

```lua
table
```

Picked texture coordinates, for brushes or models.

## Example

```lua
local pick = PickInfo()

pick.entity = Entity()
pick.face = Face()
pick.mesh = Mesh()
pick.normal = xVec3()
pick.polygon = 0
pick.position = xVec3()
pick.success = true
pick.texcoords = { Vec2(), Vec2() }
```