# Entity.GetRotation

This method retrieves the entity's rotation.

## Syntax

```csharp
xVec3 GetRotation(bool global = false);
```

| Parameter | Description |
| --- | --- |
| global | if set to true the global rotation is returned, otherwise local space is used |

## Returns

Returns this entity's rotation as a Euler angle, in local or global space.

## Example

```csharp
xVec3 rotation = entity.GetRotation();
```