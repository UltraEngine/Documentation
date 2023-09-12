## Entity:setPickMode

This function sets the pick mode of an entity for raycasting operations.

### Syntax

```lua
entity:setPickMode(pickmode)
```

#### Parameters

- `pickmode` (number): The pick mode to set. This can be one of the following values:
  - `PICK_NONE`: No picking is enabled.
  - `PICK_MESH`: Picking is enabled for the entity's mesh.
  - `PICK_COLLIDER`: Picking is enabled for the entity's collider.

### Example

```lua
-- Set pick mode to PICK_MESH for an entity
entity:setPickMode(PICK_MESH)
```