# Terrain.GetElevation

This method gets the height of the terrain, in global coordinates.

## Syntax

- float **GetElevation**(int tx, int ty)
- float **GetElevation**(iVec2 coord)
- float **GetElevation**(float x, float y, float z)
- float **GetElevation**(Vec3 position)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | global position |

## Returns

Returns the global height of the terrain above the terrain position at the specified coordinate, or the interpolated height at the specified global position.

### Example

```csharp
float elevation1 = terrain.GetElevation(5, 10);

iVec2 coord = new iVec2(5, 10);
float elevation2 = terrain.GetElevation(coord);

float x = 10.0f;
float y = 20.0f;
float z = 30.0f;
float elevation3 = terrain.GetElevation(x, y, z);

Vec3 position = new Vec3(10.0f, 20.0f, 30.0f);
float elevation4 = terrain.GetElevation(position);
```