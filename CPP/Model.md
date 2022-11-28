# Model

Base class: [Entity](Entity.md)

The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

Ultra Engine natively supports loading and saving of models in the [glTF](https://www.khronos.org/gltf/) and Wavefront OBJ file formats. Other model formats can be loaded via the [plugin](Plugin.md) system.

| Property | Type | Description |
|---|---|---|
| lods | const vector<shared_ptr<[Lod](Lod.md)\> \>& | read-only array of Lods |
| skeleton | const shared_ptr<[Skeleton](Skeleton.md)\>& | read-only skeleton object |
| [AddMesh](Model_AddMesh.md) | Method | adds a new mesh to the model |
| [AddLod](Model_AddLod.md) | Method | adds a new level-of-detail to the model |
| [Animate](Model_Animate.md) | Method | animates the model |
| [Clear](Model_Clear.md) | Method | removes all meshes |
| [Save](Model_Save.md) | Method | saves the model to a file |
| [SetSkeleton](Model_SetSkeleton) | Method | allows models to share a single skeleton |
| [UpdateNormals](Model_UpdateNormals.md) | Method | calculates new mesh normals |
| [CreateBox](CreateBox.md) | Function | creates a new box model |
| [CreateCone](CreateCone.md) | Function | creates a new cone model |
| [CreateCubeSphere](CreateCubeSphere.md) | Function | creates a new sphere model |
| [CreateCylinder](CreateCylinder.md) | Function | creates a new cylinder model |
| [CreateSphere](CreateSphere.md) | Function | creates a new sphere model |
| [CreateModel](CreateModel.md) | Function | creates a new model |
| [LoadModel](LoadModel.md) | Function | loads a model from a file |
