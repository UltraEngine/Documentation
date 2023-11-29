## Syntax

- void **SetRotation**(float x, float y, float z)
- void **SetRotation**([Vec3](Vec3.md) position)

| Parameter | Description |
|---|---|
| rotation (x, y, z) | navigation agent rotation to set |

## Example

```csharp
NavAgent agent = new NavAgent();
agent.SetRotation(0.0f, 90.0f, 0.0f);

// OR

Vec3 rotation = new Vec3(0.0f, 90.0f, 0.0f);
agent.SetRotation(rotation);
```