# Entity.GetVelocity

This method retrieves the entity velocity after the previous physics update, in global or local space.

## Syntax

```csharp
public Vector3 GetVelocity(bool global = true)
```

| Parameter | Description |
| --- | --- |
| global | if set to true global space is used, otherwise local space is used |

## Returns

Returns the entity's velocity, in meters per second.

## Example

```csharp
Vector3 velocity = entity.GetVelocity();
Console.WriteLine("Entity velocity: " + velocity);
```