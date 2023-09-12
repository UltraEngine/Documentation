## Syntax

`World:ClearCollisionResponses()`

This method clears all built-in and custom collision responses.

## Example

```lua
-- Create a new instance of the World class
local world = World()

-- Add custom collision responses
world:AddCollisionResponse(ColliderType.PLAYER, ColliderType.ENEMY, CustomCollisionResponse)

-- Clear all collision responses
world:ClearCollisionResponses()
```