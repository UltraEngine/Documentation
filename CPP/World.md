# World

**Base class:** [Object](Object.md)

The world class is a container for entities.

## Properties

| Name | Type | Description |
|---|---|---|
| collisions | const vector<[Collision](Collision.md)\> collisions | read-only list of collisions recorded in previous physics update |
| physicsengine | const [PhysicsEngine](Constants.md#PhysicsEngine)& | read-only physics engine in use |
| physicsstats | [PhysicsStats](PhysicsStats.md) |  |
| renderstats | [RenderStats](RenderStats.md) |  |
| [ClearCollisionResponses](World_ClearCollisionResponses.md) | Method | |
| [GetCollisionResponse](World_GetCollisionResponse.md) | Method | |
| [GetEntitiesInArea](World_GetEntitiesInArea.md) | Method | |
| [Pick](World_Pick.md) | Method | |
| [RecordStats](World_RecordStats.md) | Method | |
| [Render](World_Render.md) | Method | |
| [SetCollisionResponse](World_SetCollisionResponse.md) | Method | |
| [SetGravity](World_SetGravity.md) | Method | |
| [SetSkybox](World_SetSkybox.md) | Method | |
| [Update](World_Update.md) | Method | |
| [CreateWorld](CreateWorld.md) | Function | |
