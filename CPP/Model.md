# Model

Base class: [Entity](Entity.md)

The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

The main supported model file format is the [glTF](https://www.khronos.org/gltf/) format by Khronos. Other model formats can be loaded via the [plugin](Plugins.md) system.

| Property | Type | Description |
|---|---|---|
| lods | const vector<shared_ptr<[Lod](Lod.md)\> \>& | Read-only array of Lods |
| skeleton | const shared_ptr<[Skeleton](Skeleton.md)\>& | Read-only skeleton object |
| [AddMesh](Model_AddMesh.md) | Method | Adds a new mesh to the model |
| [AddLod](Model_AddLod.md) | Method |  Adds a new level-of-detail to the model. |
| [Animate](Model_Animate.md) | Method |  |
| [Save](Model_Save.md) | Method |  Saves the model to a file. |
| [SetMaterial](Model_SetMaterial.md) | Method |  Applies a material to the model's meshes. |
