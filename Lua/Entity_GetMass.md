# Entity:GetMass

This method is used to retrieve the entity's physical mass.

## Syntax

```lua
function Entity:GetMass()
```

## Returns

Returns the entity mass, in kilograms.

## Example

```lua
-- create an entity
local entity = Entity()

-- set the mass of the entity
entity:SetMass(10)

-- retrieve the mass of the entity
local mass = entity:GetMass()

print("Entity mass: " .. mass .. " kg")
```