# Entity.GetPhysicsMode

This method gets the entity physics behavior.

## Syntax

```csharp
PhysicsMode GetPhysicsMode()
```

## Returns

Returns `PhysicsMode.None`, `PhysicsMode.Rigidbody`, or `PhysicsMode.Player`.

Example:

```csharp
PhysicsMode mode = GetPhysicsMode();
```