# Entity:GetHidden

This function can be used to check whether an entity is currently hidden.

## Syntax

```lua
function Entity:GetHidden(recursive)
```

### Parameters

- `recursive` (optional): If set to true, the entity's parent hierarchy will be checked. Otherwise, only this entity's hide state will be returned.

## Returns

Returns `true` if the entity is hidden, otherwise `false` is returned.

## Example

```lua
-- Create a new entity
local entity = Entity()

-- Check if the entity is hidden
local hidden = entity:GetHidden()

if hidden then
    print("The entity is hidden")
else
    print("The entity is not hidden")
end
```