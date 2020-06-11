# Entity::Instantiate #
This method returns an instanced copy of the entity. Resources such as model meshes are shared.

## Syntax ##
- shared_ptr<[Entity](CPP_Entity.md)\> Instantiate()
- shared_ptr<[Entity](CPP_Entity.md)\> Instantiate(shared_ptr<[World](CPP_World.cpp)> world, const bool recursive = true, const bool callstart = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **world** | world to create new instance in | 
| **recursive** | if set to true the entity subhierarchy will also be copied |
| **callstart** | if set to true the Start function will be called for all attached actors and scripts |

