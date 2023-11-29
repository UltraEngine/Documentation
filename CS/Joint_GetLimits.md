## Syntax

```csharp
Vector2 GetLimits();
```

## Returns

Returns the minimum and maximum limits of a hinge or ball and socket joint in degrees, or a slider joint in meters.

## Example

```csharp
Vector2 limits = Joint.GetLimits();
float minLimit = limits.x;
float maxLimit = limits.y;
```