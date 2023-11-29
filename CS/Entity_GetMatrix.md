## Syntax (C#)

- [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=net-5.0) **GetMatrix**(bool global = true)

| Parameter | Description |
|---|---|
| global | If true, the world-space matrix will be returned. Otherwise, the local matrix is returned. |

## Example (C#)

```csharp
Matrix4x4 matrix = entity.GetMatrix();
```
