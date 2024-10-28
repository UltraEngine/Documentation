# Entity:FindChild

This method searches the entity subhierarchy for a child with a specified name. Name searches are case-sensitive.

## Syntax

- [Entity](Entity.md) **FindChild**([string](https://www.lua.org/manual/5.4/manual.html#6.4) name, boolean casesensitive = true)
- table **FindChildren**(([string](https://www.lua.org/manual/5.4/manual.html#6.4), boolean casesensitive = true)

| Parameter | Description |
| --- | --- |
| name | name of the entity to find |
| casesensitive | if set to true the name search will be case-sensitive |
| results | all matching children will be added to the end of the table |

## Returns

Returns the first entity found with the specified name, or the number of children found.

## Remarks

This method can be used to find a single child or multiple children. An asterisk can be used in the name for pattern matching. For example FindChild("wheel*") would return a child named "wheel01" or "wheel_2".
