# CreateWorld

This function creates a new world object.

## Syntax

- shared_ptr<[World](World.md)\> **CreateWorld**(const [PhysicsEngine](Constants.md#PhysicsEngine) physicsengine)

| Parameter | Description |
|---|---|
| physicsengine | physics engine to use, can be PHYSICSENGINE_NONE, PHYSICSENGINE_BOX2D, or PHYSICSENGINE_NEWTON |

## Returns ##

Returns a new world object.
