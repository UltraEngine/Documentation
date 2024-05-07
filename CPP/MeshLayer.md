# MeshLayer

Base class: [Object](Object.md)

The mesh layer class provides a very efficient interface to display large amounts of vegetation, rocks, and other instanced objects on a terrain.

Mesh layers are created using the [Terrain::AddMeshLayer](Terrain_AddMeshLayer.md) method.

| Property | Type | Description |
| --- | --- | --- |
| extra | [Object](Object.md) | user-defined object |
| name | [WString](WString.md) | user-defined name |
| [AddVariation](MeshLayer_AddVariation.md) | Method | adds a new mesh layer variation |
| [Clear](MeshLayer_Clear.md) | Method | makes each instance invisible |
| [CountVariations](Mesh_CountVariations.md) | Method | returns the number of mesh layer variations |
| [Fill](MeshLayer_Fill.md) | Method | makes each instance visible, respecting slope and height constraints |
| [GetCollisionType](MeshLayer_GetCollisionType.md) | Method | returns the mesh layer collision type |
| [GetInstanceMatrix](MeshLayer_GetInstanceMatrix.md) | Method | returns the orientation of the specified instance |
| [GetInstanceVariation](MeshLayer_GetInstanceVariation.md) | Method | returns the index of the variation the specified instance uses |
| [GetInstanceVisible](MeshLayer_GetInstanceVisible.md) | Method | gets the visibility of the specified instance |
| [GetInstancesInArea](MeshLayer_GetInstancesInArea.md) | Method | returns an array of all the instances within the specified area |
| [GetPickMode](MeshLayer_GetPickMode.md) | Method | returns the mesh layer pick mode |
| [GetShadows](MeshLayer_GetShadows.md) | Method | returns the mesh layer shadow casting mode |
| [SetAlignment](MeshLayer_SetAlignment.md) | Method | sets the mesh layer alignment mode |
| [SetCollider](MeshLayer_SetCollider.md) | Method | sets the mesh layer collider |
| [SetCollisionType](MeshLayer_SetCollisionType.md) | Method | sets the mesh layer pick mode |
| [SetSpacing](MeshLayer_SetSpacing.md) | Method | sets the mesh layer instance spacing |
| [SetHeightConstraints](MeshLayer_SetHeightConstraints.md) | Method | sets the mesh layer height constraints |
| [SetInstanceVisible](MeshLayer_SetInstanceVisible.md) | Method | sets the visibility of the specified instance |
| [SetLodDistance](MeshLayer_SetLodDistance.md) | Method | sets the mesh layer LOD distance |
| [SetModel](MeshLayer_SetModel.md) | Method | sets the mesh layer model |
| [SetPickMode](MeshLayer_SetPickMode.md) | Method | sets the mesh layer pick mode |
| [SetSeed](MeshLayer_SetSeed.md) | Method | sets the mesh layer random seed |
| [SetShadows](MeshLayer_SetShadows.md) | Method | sets the mesh layer shadow casting mode |
| [SetSlopeConstraints](MeshLayer_SetSlopeConstraints.md) | Method | sets the mesh layer slope constraints |
| [SetViewDistance](MeshLayer_SetViewDistance.md) | Method | sets the mesh layer view distance |
| [SetWeight](MeshLayer_SetWeight.md) | Method | sets the weighting of the specified variation |
