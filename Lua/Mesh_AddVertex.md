# Mesh:AddVertex

This method adds a new vertex to the mesh.

## Syntax

- **Mesh:AddVertex**(position, normal, texcoords, displacement) -> uint32_t
- **Mesh:AddVertex**(x, y, z, nx, ny, nz, u0, v0, displacement) -> uint32_t

### Parameters

- position, (x, y, z): The vertex position.
- normal, (nx, ny, nz): The vertex normal.
- texcoords, (u, v): The vertex texture coordinates.
- displacement: The maximum tessellation displacement value.

## Returns

The index of the new vertex.

## Remarks

Once a mesh has been submitted to the rendering thread, additional vertices cannot be added to it. This occurs during the first call to [World::Render](World_Render.md) after the mesh is created.