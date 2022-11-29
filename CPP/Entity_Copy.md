# Entity::Copy

This method returns a unique copy of the entity. Resources such as model meshes are duplicated, creating a new unique object. For faster performance and lower memory usage, consider using the [Instantiate](Entity_Instantiate.md) method instead.

## Syntax

- shared_ptr<[Entity](Entity.md)\> **Copy**(shared_ptr<[World](World.md)> world, const bool recursive = true, const bool callstart = true)

| Parameter | Description |
| --- | --- |
| world | world to create new copy in | 
| recursive | if set to true the entity subhierarchy will also be copied |
| callstart | if set to true the Start function will be called for all attached actors and scripts |

## Returns

Returns a copy of the entity.
