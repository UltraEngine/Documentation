# Entity::AddScript #
This method adds a Lua script file to an entity. The properties and functions contained in the script will be added to the entity.

## Syntax ##
- bool **AddScript**(const string& path, const bool callstart = true)
- bool **AddScript**(const wstring& path, const bool callstart = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | path to the script file |
| **callstart** | if set to true true the Start function will be called |

## Returns ##
Returns true if the script was loaded and added, otherwise false is returned.
