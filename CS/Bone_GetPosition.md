## Syntax

- [Vec3](Vec3.md) **GetPosition**(bool global = false)

| Parameter | Description |
|---|---|
| global | if set to true position is relative to the skeleton, otherwise it is relative to the bone's parent |

## Returns

Returns the bone's position.

## C# Example

```csharp
Vec3 bonePosition = GetPosition(global: false);
```