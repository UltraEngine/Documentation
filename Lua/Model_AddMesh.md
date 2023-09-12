# Model:AddMesh

This method creates or inserts an existing mesh on the model.

## Syntax

#### model:AddMesh(type, lod)
#### model:AddMesh(mesh, lod)

### Parameters
- **type** *(optional)*: primitive type, can be MESH_POINTS, MESH_LINES, MESH_TRIANGLES, or MESH_QUADS.
- **mesh** *(optional)*: adds an existing mesh to the model.
- **lod**: mesh detail level.

### Returns
Returns the added mesh (shared_ptr<Mesh>).

## Example
```lua
local model = Model()

-- Create a new mesh and add it to the model
local newMesh = model:AddMesh(MESH_TRIANGLES, 0)

-- Add an existing mesh to the model
local existingMesh = Mesh()
local addedMesh = model:AddMesh(existingMesh, 1)
```