# Entity::SetParent #
This method can be used to parent one entity to another. The child entity will move relative to the parent. If the parent is hidden, the child will also be hidden.

## Syntax ##
- void **SetParent**(shared_ptr<[Entity](CPP_Entity_32f.md)\> entity, const bool global = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **parent** | new parent to set or NULL for no parent |
| **global** | if set to true the child will retain its global orientation, otherwise it will retain its local orientation relative to the new parent |
