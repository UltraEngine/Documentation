### Syntax

- [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=net-6.0) **GetLayerSlopeConstraints**(int layer, int x, int y)
- [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=net-6.0) **GetLayerSlopeConstraints**(int layer, [Vector2](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector2?view=net-6.0)& coord)

| Parameter | Description |
| --- | --- |
| layer | layer index to use |
| coord, (x, y) | terrain coordinate |
---

### Returns

Returns the minimum angle, maximum angle, and slope transition values.