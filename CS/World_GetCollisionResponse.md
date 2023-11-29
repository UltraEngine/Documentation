# World.GetCollisionResponse

This method can be used to get the collision response between different collision types.

## Syntax

```csharp
CollisionResponse GetCollisionResponse(int type1, int type2)
```

| Parameter | Description |
|---|---|
| type1 | one of the collision types in the collision |
| type2 | the other collition type in the collision |

## Returns

This can return `CollisionResponse.None`, `CollisionResponse.Collide`, or `CollisionResponse.Detect`.