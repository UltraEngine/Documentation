# Entity:Translate

This method repositions an entity relative to its parent orientation.

---

## Syntax

```lua
function Entity:Translate(translation: xVec3, global: boolean = false)
function Entity:Translate(x: number, y: number, z: number, global: boolean = false)
```

---

| Parameter | Description |
| --- | --- |
| translation, (x, y, z) | movement to apply to the entity |
| global | if set to false, movement occurs relative to the parent space, otherwise world space is used |

---

## Example

```lua
-- Creating an entity
local entity = Entity()

-- Translating the entity using a xVec3 object
local translation = xVec3(1, 2, 3)
entity:Translate(translation)

-- Translating the entity using separate x, y, z coordinates
entity:Translate(4, 5, 6, true)
```