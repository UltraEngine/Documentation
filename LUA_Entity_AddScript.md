# Entity.AddScript #
This method adds a Lua script file to an entity. The properties and functions contained in the script will be added to the entity.

## Syntax ##
- boolean **AddScript**(string path, boolean callstart = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **path** | path to the script file |
| **callstart** | if set to true true the Start function will be called |

## Returns ##
Returns true if the script was loaded and added, otherwise false is returned.

## Remarks ##
You can add multiple scripts to an entity. If scripts contain overlapping properties, then the most recent value will overwrite the existing value. If scripts contain overlapping function names, they will be sorted into a metafunction that calls each version of the function, in the order they were added. If multiple script functions return multiple values, they will all be returned by the metafunction.
