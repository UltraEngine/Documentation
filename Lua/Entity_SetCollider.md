# Entity:SetCollider #

This method sets the entity's collision shape for physics.

## Syntax ##

```lua
function Entity:SetCollider(collision)
```

### Parameters ###

- `collision` (userdata): A shared pointer to a Collider object.

## Example ##

```lua
-- Create the Collider object
local collider = Collider()

-- Set the entity's collision shape
entity:SetCollider(collider)
```