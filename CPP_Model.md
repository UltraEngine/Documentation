# Model #
The model class is used for visible 3D objects. Models can be loaded from files or created from scratch.

The main supported model file format is the [glTF](https://www.khronos.org/gltf/) format by Khronos. Other model formats can be loaded via the [plugin](Plugins.md) system.

## Base Class
* [Entity](CPP_Entity_32f.md)

## Members
- const vector<shared_ptr<[LOD](CPP_LOD.md)\> \>& lods
- const shared_ptr<[Skeleton](CPP_Skeleton.md)\>& skeleton

## Methods
- [Animate](CPP_Model_Animate.md)
