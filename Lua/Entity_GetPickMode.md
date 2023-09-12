# Entity.GetPickMode

This function retrieves the entity pick mode.

## Syntax

- `pickMode = Entity:GetPickMode()`

## Returns

Returns the entity pick mode. This may be PICK_NONE, PICK_SPHERE, or PICK_MESH.

## Example

```lua
-- Create a new entity
local entity = Entity()

-- Set the entity pick mode to PICK_SPHERE
entity:SetPickMode(PICK_SPHERE)

-- Get the entity pick mode
local pickMode = entity:GetPickMode()

-- Print the pick mode
print("Pick mode: " .. pickMode)
```