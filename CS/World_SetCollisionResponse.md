# World.SetCollisionResponse

This method can be used to set custom collision responses between different collision types.

## Syntax

```csharp
void SetCollisionResponse(int type1, int type2, CollisionResponse response)
```

| Parameter | Description |
|---|---|
| type1 | one of the collision types in the collision |
| type2 | the other collition type in the collision |
| response | the collision response, can be CollisionResponse.None, CollisionResponse.Collide, or CollisionResponse.Detect |

## Remarks

The collision types can be any integer value or predefined collision type:
- CollisionType.None
- CollisionType.Prop
- CollisionType.Scene
- CollisionType.Player
- CollisionType.Trigger
- CollisionType.Debris
- CollisionType.Projectile

The table below shows the default collision responses the engine defines for each new world:

| Type 1 | Type 2 | Response |
|---|---|---|
| CollisionType.Prop | CollisionType.Prop | CollisionResponse.Collide |
| CollisionType.Prop | CollisionType.Scene | CollisionResponse.Collide |
| CollisionType.Debris | CollisionType.Scene | CollisionResponse.Collide |
| CollisionType.Debris | CollisionType.Prop | CollisionResponse.Collide |
| CollisionType.Scene | CollisionType.Player | CollisionResponse.Collide |
| CollisionType.Prop | CollisionType.Player | CollisionResponse.Collide |
| CollisionType.Player | CollisionType.Player | CollisionResponse.Collide |
| CollisionType.Scene | CollisionType.Projectile | CollisionResponse.Collide |
| CollisionType.Prop | CollisionType.Projectile | CollisionResponse.Collide |
| CollisionType.Player | CollisionType.Trigger | CollisionResponse.Detect |