### Syntax

```csharp
void Translate(Vector3 translation, bool global = false);
void Translate(float x, float y, float z, bool global = false);
```

### Parameters

- `translation` or `(x, y, z)`: movement to apply to the entity
- `global`: if set to false movement occurs relative to the parent space, otherwise world space is used

**Note:** [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=net-5.0) is used as the equivalent type for `xVec3` in C#.