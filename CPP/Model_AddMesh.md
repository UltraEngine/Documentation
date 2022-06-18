# Model::AddMesh

This method creates or inserts an existing mesh on the model.

## Syntax

- shared_ptr<[Mesh](Mesh.md)\> **AddMesh**(const MeshPrimitives type = MESH_TRIANGLES, const int lod = 0)
- shared_ptr<[Mesh](Mesh.md)\> **AddMesh**(shared_ptr<[Mesh](Mesh.md)\> mesh, const int lod = 0)

| Parameter | Description |
|---|---|
| type | primitive type, can be MESH_LINES, MESH_TRIANGLES, or MESH_QUADS |
