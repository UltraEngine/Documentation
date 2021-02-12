# Model #
The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

The main supported model file format is the [glTF](https://www.khronos.org/gltf/) format by Khronos. Other model formats can be loaded via the [plugin](Plugins.md) system.

## Base Class
* [Entity](Entity_32f.md)

## Members
| Name | Description |
|---|---|
| const vector<shared_ptr<[LOD](LOD.md)\> \>& lods | Read-only array of LODs |
| const shared_ptr<[Skeleton](Skeleton.md)\>& skeleton | Read-only skeleton object |

## Methods
| Name | Description |
|---|---|
| [AddLOD](Model_AddLOD.md) | Adds a new level-of-detail to the model. |
| [Animate](Model_Animate.md) | |
| [Save](Model_Save.md) | Saves the model to a file. |
| [SetLODScreenSize](Model_SetLODScreenSize.md) | Sets the screen size at which a level-of-detail is used. |
| [SetMaterial](Model_SetMaterial.md) | Applies a material to the model's meshes. |