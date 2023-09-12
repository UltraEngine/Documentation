# Entity:Turn

This function turns an entity. It applies a rotation to the entity, producing smooth rotation without Gimbal lock problems.

## Syntax

- **Entity:Turn**(rotation: xQuat, global: boolean = false)
- **Entity:Turn**(rotation: xVec3, global: boolean = false)
- **Entity:Turn**(pitch: number, yaw: number, roll: number, global: boolean = false)

## Parameters

- rotation: The rotation to apply. It can be either an xQuat object or an xVec3 object representing Euler angles.
- pitch, yaw, roll: The Euler angles representing the rotation.
- global: If set to true, the rotation is applied in global space. Otherwise, it is applied in local space.

## Example

```lua
-- Creating an entity
local entity = Entity()

-- Applying a rotation using xQuat object
local rotation = xQuat(0, 0.707, 0, 0.707)
entity:Turn(rotation)

-- Applying a rotation using Euler angles
entity:Turn(45, 0, 0)

-- Applying a global rotation using Euler angles
entity:Turn(0, 180, 0, true)
```