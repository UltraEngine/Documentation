# Entity:SetParent
This method sets an entity's parent, if it exists.

## Syntax
`entity:SetParent(parent, global=true)`

### Parameters
- **parent** (optional): the parent entity to set. This value can be nil or any entity that is not this entity or a child of this entity.
- **global** (optional): if set to true, this entity's global orientation is maintained; otherwise, the entity is reoriented to match the parent's space.

## Example
```lua
-- Assuming entity1 and entity2 are defined previously

-- Set entity1 as the parent of entity2
entity2:SetParent(entity1)

-- Set entity1 as the parent of entity2, maintaining the global orientation
entity2:SetParent(entity1, true)

-- Set entity1 as the parent of entity2, reorienting entity2 to match entity1's space
entity2:SetParent(entity1, false)
```