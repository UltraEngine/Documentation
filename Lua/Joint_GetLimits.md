# Joint:GetLimits

This method returns limits of a hinge, slider, or ball and socket joint.

## Syntax

`limits = Joint:GetLimits()`

## Returns

Returns the minimum and maximum limits of a hinge or ball and socket joint in degrees, or a slider joint in meters.

## Example

```lua
-- Create a new joint
local joint = Joint()

-- Set the joint limits
joint:SetLimits(-90, 90)

-- Get the joint limits
local limits = joint:GetLimits()

-- Print the joint limits
print("Minimum Limit: " .. limits.x)
print("Maximum Limit: " .. limits.y)
```