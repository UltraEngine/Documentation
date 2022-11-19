# World::SetCollisionResponse

This method can be used to set custom collision responses between different collision types.

- void **SetCollisionResponse**(const int type1, const int type2, const CollisionResponse response)

| Parameter | Description |
|---|---|
| type1 | one of the collision types in the collision |
| type2 | the other collition type in the collision |
| response | the collision response, can be COLLISIONRESPONSE_NONE, COLLISIONRESPONSE_COLLIDE, or COLLISIONRESPONSE_DETECT |
