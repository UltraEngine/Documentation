# Model

Base class: [Entity](Entity.md)

The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

Ultra Engine natively supports loading and saving of models in the [glTF](https://www.khronos.org/gltf/) and Wavefront OBJ file formats. Other model formats can be loaded via the [plugin](Plugin.md) system.

| Property | Type | Description |
|---|---|---|
| lods | [table](https://www.lua.org/manual/5.4/manual.html#6.6) | read-only array of Lods |
| skeleton | [table](https://www.lua.org/manual/5.4/manual.html#6.6) | read-only skeleton object |
| [AddMesh](#model_addmesh) | Method | adds a new mesh to the model |
| [AddLod](#model_addlod) | Method | adds a new level-of-detail to the model |
| [Animate](#model_animate) | Method | animates the model |
| [Clear](#model_clear) | Method | removes all meshes |
| [Save](#model_save) | Method | saves the model to a file |
| [SetLodDistance](#model_setloddistance) | Method | sets the base Lod distance factor |
| [SetSkeleton](#model_setskeleton) | Method | allows models to share a single skeleton |
| [UpdateNormals](#model_updatenormals) | Method | calculates new mesh normals |
| [CreateBox](#createbox) | Function | creates a new box model |
| [CreateCone](#createcone) | Function | creates a new cone model |
| [CreateCubeSphere](#createcubesphere) | Function | creates a new sphere model |
| [CreateCylinder](#createcylinder) | Function | creates a new cylinder model |
| [CreateModel](#createmodel) | Function | creates a new model |
| [CreatePlane](#createplane) | Function | creates a new plane model |
| [CreateSphere](#createsphere) | Function | creates a new sphere model |
| [LoadModel](#loadmodel) | Function | loads a model from a file |
