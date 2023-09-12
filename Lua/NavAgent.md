# NavAgent

Base class: [Object](Object.md)

This class is used to create and plot navigation paths and perform crowd movement.

| Property | Type | Description |
| ----- | ----- | ----- |
| [Navigate](NavAgent_Navigate.md) | Function | moves the agent to the specified destination |
| [SetMaxAcceleration](NavAgent_SetMaxAcceleration.md) | Function | sets maximum acceleration |
| [SetMaxSpeed](NavAgent_SetMaxSpeed.md) | Function | sets maximum speed |
| [SetPosition](NavAgent_SetPosition.md) | Function | manually sets the agent position |
| [SetRotation](NavAgent_SetRotation.md) | Function | manually sets the agent rotation |
| [Stop](NavAgent_Stop.md) | Function | cancels navigation |
| [CreateNavAgent](CreateNavAgent.md) | Function | creates a new navigation agent |

```lua
-- Moves the agent to the specified destination
-- @param destination (Vector3) the destination to navigate to
-- @return nil
function NavAgent:Navigate(destination)
    -- implementation
end

-- Sets the maximum acceleration
-- @param acceleration (number) the maximum acceleration value
-- @return nil
function NavAgent:SetMaxAcceleration(acceleration)
    -- implementation
end

-- Sets the maximum speed
-- @param speed (number) the maximum speed value
-- @return nil
function NavAgent:SetMaxSpeed(speed)
    -- implementation
end

-- Manually sets the agent position
-- @param position (Vector3) the new position to set
-- @return nil
function NavAgent:SetPosition(position)
    -- implementation
end

-- Manually sets the agent rotation
-- @param rotation (Quaternion) the new rotation to set
-- @return nil
function NavAgent:SetRotation(rotation)
    -- implementation
end

-- Cancels navigation
-- @return nil
function NavAgent:Stop()
    -- implementation
end

-- Creates a new navigation agent
-- @param params (table) table containing initialization parameters for the navigation agent
-- @return (NavAgent) a new navigation agent instance
function CreateNavAgent(params)
    -- implementation
end
```