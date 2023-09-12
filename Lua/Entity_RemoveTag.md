### Entity:RemoveTag

This method removes a text tag from the entity.

#### Syntax

```lua
function Entity:RemoveTag(tag: WString)
```

#### Parameters

- `tag` ([WString](WString.md)): The text tag to remove from the entity.

#### Example

```lua
-- Create a new entity
local entity = Entity()

-- Add a tag to the entity
entity:AddTag("Player")

-- Remove the "Player" tag from the entity
entity:RemoveTag("Player")
```