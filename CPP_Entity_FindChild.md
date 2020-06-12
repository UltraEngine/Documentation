# Entity::FindChild #
This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax ##
- shared_ptr<[Entity](CPP_Entity_32f.md)\> **FindChild**(const string& name, const bool casesensitive = true)
- shared_ptr<[Entity](CPP_Entity_32f.md)\> **FindChild**(const wstring& name, const bool casesensitive = true)
- int **FindChild**(const string& name, vector<shared_ptr<[Entity](CPP_Entity_32f.md)\>\> results, const bool casesensitive = true)
- int **FindChild**(const wstring& name, vector<shared_ptr<[Entity](CPP_Entity_32f.md)\>\> results, const bool casesensitive = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **name** | name of the entity to find |
| **casesensitive** | if set to true the name search will be case-sensitive |
| **results** | all matching children will be added to the end of the array |

## Returns ##
Returns the first entity found with the specified name, or the number of children found.

## Remarks ##
This method can be used to find a single child or multiple children. An asterisk can be used in the name for pattern matching. For example FindChild("wheel*") would return a child named "wheel01" or "wheel_2".
