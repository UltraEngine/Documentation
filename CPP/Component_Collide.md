# Component::Collide

This method is called every time the entity collides with another object.

## Syntax

- void **Collide**(shared_ptr<[Entity](Entity.md)> collidedentity, const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal, const dFloat speed)

| Parameter | Description |
|---|---|
| collidedentity | entity that was collided with |
| position | point the collision occured at |
| normal | direction of the collision |
| speed | speed of the collision |
