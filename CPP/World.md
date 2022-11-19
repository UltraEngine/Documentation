# World

Base class: [Object](Object.md)

The world class is a container for entities.

| Property | Type | Description |
|---|---|---|
| collisions | const vector<[Collision](Collision.md)\> collisions | read-only list of collisions recorded in previous physics update |
| physicsstats | [PhysicsStats](PhysicsStats.md) | physics statistics |
| renderstats | [RenderStats](RenderStats.md) | rendering statistics |
| [ClearCollisionResponses](World_ClearCollisionResponses.md) | Method | clears all collision responses |
| [GetAmbientLight](World_GetAmbientLight.md) | Method | returns the ambient light color |
| [GetCollisionResponse](World_GetCollisionResponse.md) | Method | returns the collision response for collisions between the specified collision types |
| [GetEntitiesInArea](World_GetEntitiesInArea.md) | Method | returns an array of entities that intersect the specified bounding box |
| [GetTaggedEntities](World_GetTaggedEntities.md) | Method | returns an array of entities with the specified tag |
| [Pick](World_Pick.md) | Method | performs a raycast |
| [RecordStats](World_RecordStats.md) | Method | enables statistics recording |
| [Render](World_Render.md) | Method | renders the world |
| [Save](World_Save.md) | Method | serializes the world to a file |
| [SetCollisionResponse](World_SetCollisionResponse.md) | Method | sets the collision response for collisions between the specified collision types |
| [SetGravity](World_SetGravity.md) | Method | sets the world gravity force |
| [SetEnvironmentMap](World_SetEnvironmentMap.md) | Method | sets the skybox or specular and diffuse reflection maps |
| [SetAmbientLight](World_SetAmbientLight.md) | Method | sets the ambient light color |
| [Update](World_Update.md) | Method | updates physics, pathfinding, and other systems |
| [CreateWorld](CreateWorld.md) | Function | creates a new world |
