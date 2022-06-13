# Terrain::SetMaterial

This method sets the terrain material at any point on the heightmap. Up to four materials can be set per point.

## Syntax

- bool **SetMaterial**(const [iVec2](iVec2.md) coord, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(const int x, const int y, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f, const bool normalize = true)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const bool recursive = false)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints)
- bool **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints, const [Vec3](Vec3.md)& elevationconstraints)

| Parameter | Description |
|---|---|
| material | material to apply |
| weight | influence the material has at this point |
| normalize | if set to true, other materials at this point will be adjusted so the sum of all material weights is 1.0 |
| recursive | if set to true, the material will be applied to all children in the entity's subhierarchy |
| slopeconstraints | minimum and maximum slope over which the material will appear, and blending range, in degrees |
| elevationconstraints | minimum and maximum elevation over which the material will appear, and blending range, in meters |

## Returns

If the terrain is not currently using the specified material but is already using the maximum number of materials false is returned, otherwise true is returned.

## Remarks

The first variation of this method will apply the specified material to one point on the terrain, with a weighting value. Up to four materials can be applied to any terrain point. Their weights will be normalized before rendering. If the material has already been applied at this terrain point, its weighting value will be replaced.

The second variation will apply the material to the entire terrain.

The third and fourth variations will apply the material to the entire terrain, using slope and height constraints to determine where it should appear. The x coordinate of the constraint is the minimum value above which the material will appear. The y coordinate is the maximum value below which the material will appear. The z coordinate is a range over which the material will be blended in.

If the terrain point already has four materials applied, the material with the lowest influence less than or equal to the influence parameter will be replaced. If all materials have a higher influence than the new material, no change will occur.

If material is NULL, with any variation of this method, all materials will be removed.

If the terrain already is using the maximum number of materials, no change will occur.

## Example

```c++
auto terrain = LoadTerrain(world, "terrain.r16");

//Apply grass everywhere
auto grass = LoadMaterial("grass.json");
terrain->SetMaterial(grass);

//Apply random patches of dirt
auto dirt = LoadMaterial("dirt.json");
auto noisemap = GenerateNoiseMap(64,64);
for (int x = 0; x < terrain->resolution.x; ++x)
{
  for (int y = 0; y < terrain->resolution.y; ++y)
  {
    unsigned int rgba = noisemap->ReadPixel(Mod(x, noisemap->size.x), Mod(y, noisemap->size.y));
    float influence = float(Red(rgba)) / 255.0f;
    if (influence > 0.0f) terrain->SetMaterial(x, y, dirt, influence);
  }
}

//Apply rocks to steep surfaces
auto rock = LoadMaterial("rocks.json");
terrain->SetMaterial(rocks, Vec3(15,90,5));

//Apply snow to flat areas at high elevation
terrain->SetMaterial(snow, Vec3(0,24,10), Vec3(500,1000,10));
auto snow = LoadMaterial("snow.json");
```
