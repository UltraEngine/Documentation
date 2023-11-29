### C#

```csharp
public Vec3 GetLayerHeightConstraints(int layer, int x, int y);
public Vec3 GetLayerHeightConstraints(int layer, iVec2 coord);
```

| Parameter | Description |
| --- | --- |
| layer | layer index to use |
| coord, (x, y) | terrain coordinate |

### Returns

Returns the minimum elevation, maximum elevation, and height transition values.

## Example

### C#

```csharp
Vec3 constraints = GetLayerHeightConstraints(0, 10, 20);
```
```csharp
iVec2 coord = new iVec2(10, 20);
Vec3 constraints = GetLayerHeightConstraints(0, coord);
```