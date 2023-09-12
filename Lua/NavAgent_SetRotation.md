# NavAgent:SetRotation

This method can be used to manually position a navigation agent.

## Syntax

- **NavAgent:SetRotation**(x: number, y: number, z: number)
- **NavAgent:SetRotation**(position: Vec3)

## Parameters

- `x: number`, `y: number`, `z: number`: The rotation values (in radians) to set for the navigation agent.
- `position: Vec3`: A [Vec3](Vec3.md) object representing the rotation values (in radians) to set for the navigation agent.

## Example

```lua
-- Create a navigation agent
local agent = NavAgent()

-- Set the rotation using individual values
agent:SetRotation(0.0, 0.0, math.pi/2)

-- Set the rotation using a Vec3 object
local rotation = Vec3(0.0, math.pi/4, 0.0)
agent:SetRotation(rotation)
```