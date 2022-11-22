# Component::Collision

This method is called evefy time the entity collides with another object.

## Syntax

- void **Collision**(shared_ptr<[Entity](Entity.md)> collidedentity, shared_ptr<[Actor](Actor.md)> collidedactor, const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal, const dFloat speed)

| Parameter | Description |
|---|---|
| collidedentity | entity that has been collided with |
| collidedactor | collided entity's actor, or NULL if it has none |
| position | point the collision occured at |
| normal | direction of the collision |
| speed | speed of collision |
