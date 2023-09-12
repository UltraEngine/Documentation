# Entity:GetUuid

This method returns the entity's unique identifier.

## Syntax

```lua
function Entity:GetUuid()
```

## Returns

Returns the entity's globally unique identifier as a string. If the entity does not have an identifier assigned yet, a new one will be generated and returned.

## Remarks

The entity UUID can be used for synchronizing objects over a network or saving and loading game data. All entities saved in a [Scene](Scene.md) file will have a unique identifier that will allow identification across different computers.

Entities that are created in code or loaded from a model file will not have a consistent UUID. For example, if a server and client both call the `CreateBox` function to create an object, their UUIDs will not match.