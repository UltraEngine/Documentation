# Entity::FindChild #
This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax ##
- shared_ptr<[Entity](CPP_Entity_FindChild.md)\> **FindChild**(const string& name)
- shared_ptr<[Entity](CPP_Entity_FindChild.md)\> **FindChild**(const wstring& name)

### Parameters ###
| Name | Description |
| --- | --- |
| name | name of the entity to find |

## Returns ##
Returns the first entity found with the specified name, or NULL if nothing is found.
