# Model #
The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

The main supported model file format is the [glTF](https://www.khronos.org/gltf/) format by Khronos. Other model formats can be loaded via the [plugin](Plugins.md) system.

## Base Class
* [Entity](CPP_Entity_32f.md)

## Members
| Name | Description |
|---|---|
| const vector<shared_ptr<[LOD](CPP_LOD.md)\> \>& lods | Read-only array of LODs |
| const shared_ptr<[Skeleton](CPP_Skeleton.md)\>& skeleton | Read-only skeleton object |

## Methods
| Name | Description |
|---|---|
| [Animate](CPP_Model_Animate.md) | |
| [Save](API_Model_Save.md) | Saves the model to a file. |
| [SetMaterial](CPP_Model_SetMaterial.md) | Applies a material to the model's meshes. |
