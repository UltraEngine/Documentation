# Component::Collide

This method is called evefy time the entity collides with another object.

## Syntax

- void **Collide**(shared_ptr<[Actor](Actor.md)> collidedactor, const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal, const dFloat speed)

| Parameter | Description |
|---|---|
| collidedactor | collided entity's actor. If the entity does not have an actor, an empty one will be created and assigned to it |
| position | point the collision occured at |
| normal | direction of the collision |
| speed | speed of the collision |
