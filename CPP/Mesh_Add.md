# Mesh::Add #
This method adds the contents of this mesh to another one.

## Syntax ##
- void Add(shared_ptr<[Mesh](Mesh)> mesh)
- void Add(shared_ptr<[Mesh](Mesh)> mesh, const [Mat4](Mat4)& transform)
- void Add(shared_ptr<[Mesh](Mesh)> mesh, const [Mat4](Mat4)& src, const [Mat4](Mat4)& dst)
- void Add(shared_ptr<[Mesh](Mesh)> mesh, const [dMat4](dMat4)& transform)
- void Add(shared_ptr<[Mesh](Mesh)> mesh, const [dMat4](dMat4)& src, const [dMat4](dMat4)& dst)