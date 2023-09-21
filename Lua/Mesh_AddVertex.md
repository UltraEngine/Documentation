# Mesh:AddVertex

This methods adds a new vertex to the mesh.

## Syntax

- number **AddVertex**([Vec3](Vec3.md) position, [Vec3](Vec3.md) normal = 0, [Vec2](Vec2.md) texcoords = 0, number displacement = 1)
- number **AddVertex**(number x, number y, number z, number nx, number ny, number nz, number u0, number v0, number displacement)
- number **AddVertex**(number x, number y, number z, number nx, number ny, number nz, number u0, number v0)
- number **AddVertex**(number x, number y, number z, number nx, number ny, number nz)
- number **AddVertex**(number x, number y, number z)

| Parameter | Description |
|---|---|
| position, (x, y, z) | vertex position |
| normal, (nx, ny, nz) | vertex normal |
| texcoords, (u, v) | vertex texture coordinates |
| displacement | maximum tessellation displacement value |

## Returns

Returns the index of the new vertex.

## Remarks

Once a mesh has been submitted to the rendering thread, additional vertices cannot be added to it. This occurs during the first call to [World::Render](World_Render.md) after the mesh is created.
