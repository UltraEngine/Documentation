# NavAgent:SetPosition

This method can be used to manually position a navigation agent.

## Syntax

- **NavAgent:SetPosition**(x: number, y: number, z: number)
- **NavAgent:SetPosition**(position: table)

| Parameter | Description |
|---|---|
| position (x, y, z) | navigation agent position to set |

## Example

```lua
-- Create a new navigation agent
local agent = NavAgent()

-- Set the position using individual coordinates
agent:SetPosition(10, 0, -5)

-- Set the position using a table
local position = {x = 5, y = 2, z = 3}
agent:SetPosition(position)
```