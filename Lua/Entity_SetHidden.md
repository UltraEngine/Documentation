# Entity:SetHidden

This method hides or shows an entity. A hidden entity is invisible and will have no collision with other objects.

## Syntax
```lua
function Entity:SetHidden(hide)
```

## Parameters

- `hide`: A boolean value indicating if the entity should be hidden (true) or visible (false).

## Example

```lua
-- Creating an entity
local myEntity = Entity.new()

-- Hiding the entity
myEntity:SetHidden(true)
```