## Syntax

```csharp
void SetPhysicsMode(PhysicsMode mode)
```

| Parameter | Description |
|---|---|
| mode | physics mode, can be [PHYSICS_NONE](https://documentation.com/physics/none), [PHYSICS_RIGIDBODY](https://documentation.com/physics/rigidbody), or [PHYSICS_PLAYER](https://documentation.com/physics/player) |

In C#:

```csharp
enum PhysicsMode {
    PHYSICS_NONE,
    PHYSICS_RIGIDBODY,
    PHYSICS_PLAYER
}

void SetPhysicsMode(PhysicsMode mode)
{
    // code to set entity physics behavior
}
```