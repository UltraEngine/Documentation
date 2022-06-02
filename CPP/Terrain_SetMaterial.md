# Terrain::SetMaterial

This method sets the terrain material at any point on the heightmap. Up to four materials can be set per point.

## Syntax

- bool **SetMaterial**(const int x, const int y, shared_ptr<[Material](Material.md)\> material, const float weight = 1.0f)
- void **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const bool recursive = false)
- void **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints)
- void **SetMaterial**(shared_ptr<[Material](Material.md)\> material, const [Vec3](Vec3.md)& slopeconstraints, const [Vec3](Vec3.md)& elevationconstraints)

## Remarks

The first variation of this method will apply the specified material to one point on the terrain, with a weighting value. Up to four materials can be applied to any terrain point. Their weights will be normalized before rendering. If the material has already been applied at this terrain point, its weighting value will be replaced.

The second variation will apply the material to the entire terrain.

The third and fourth variations will apply the material to the entire terrain, using slope and height constraints to determine where it should appear. The x coordinate of the constraint is the minimum value above which the material will appear. The y coordinate is the maximum value below which the material will appear. The z coordinate is a range over which the material will be blended in.

If the terrain point already has four materials applied, the material with the lowest influence less than or equal to the influence parameter will be replaced. If all materials have a higher influence than the new material, no change will occur.

If material is NULL, with any variation of this method, all materials will be removed.

If the terrain already is using the maximum number of materials, no change will occur.

## Returns

The first variation of this method returns true if the material is successfully applied to the terrain, otherwise false is returned.
