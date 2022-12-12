# Entity::SetParent
This method retrieves an entity's parent, if it exists.

## Syntax
- void **SetParent**(shared_ptr<[Entity](Entity.md)> parent, const bool global = true)

| Parameter | Description |
| ------ | ------ |
| parent | the parent entity to set. This value can be NULL or any entity that is not this entity or a child of this entity |
| global | if set to true this entity's global orientation is maintained, otherwise the entity is reoriented to match the parent's space. |
