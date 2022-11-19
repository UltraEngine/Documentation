# Model

Base class: [Entity](Entity.md)

The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

Ultra Engine natively supports loading and saving of models in the [glTF](https://www.khronos.org/gltf/) and Wavefront OBJ file formats. Other model formats can be loaded via the [plugin](Plugins.md) system.

| Property | Type | Description |
|---|---|---|
| lods | const vector<shared_ptr<[Lod](Lod.md)\> \>& | read-only array of Lods |
| skeleton | const shared_ptr<[Skeleton](Skeleton.md)\>& | read-only skeleton object |
| [AddMesh](Model_AddMesh.md) | Method | adds a new mesh to the model |
| [AddLod](Model_AddLod.md) | Method | adds a new level-of-detail to the model |
| [Animate](Model_Animate.md) | Method | animates the model |
| [Save](Model_Save.md) | Method | saves the model to a file |
| [UpdateNormals](Model_UpdateNormals.md) | Method | calculates new mesh normals |
| [CreateModel](CreateModel.md) | Function | creates a new model |
| [LoadModel](LoadModel.md) | Function | loads a model from a file |
