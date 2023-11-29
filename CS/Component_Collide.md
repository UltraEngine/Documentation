# Component.Collide

This method is called every time the entity collides with another object.

## Syntax

```csharp
void Collide(shared_ptr<Entity> collidedentity, Vec3 position, Vec3 normal, float speed)
```

| Parameter | Description |
|---|---|
| `collidedentity` | entity that was collided with |
| `position` | point the collision occurred at |
| `normal` | direction of the collision |
| `speed` | speed of the collision |

Example:

```csharp
public void Collide(shared_ptr<Entity> collidedentity, Vec3 position, Vec3 normal, float speed)
{
    // Code for collision handling goes here
}
```