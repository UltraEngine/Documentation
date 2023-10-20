# 3D Modeling Pipeline

Ultra Engine natively supports loading and saving of [Khronos glTF](https://www.khronos.org/gltf/) and Wavefront OBJ files. Support for additional model file formats can be added through the [plugin](Plugin.md) system.

## glTF Models

Khronos glTF is the recommended 3D model file format to use. It supports hierarchies, PBR materials, animation, and other features. The format loads quickly and is easily accessible in a variety of 3D modeling programs.

### glTF Export from Blender

To export your models to glTF format from Blender, follow these steps:

1. Open your model in Blender.

2. Go to `File` > `Export` > `Export as` and choose the *glTF 2.0* format.

3. There are several formats the glTF file can be saved in:
  - **glTF Binary (.glb)**: This packs the glTF, binary data, and textures into one single file.
  - **glTF Separate (.gltf + .bin + textures)**: This saves the glTF, binary data, and textures as separate files.
  - **glTF Embedded (.gltf)**: This packs the glTF, binary data, and textures into one single ASCII file. 

Although Ultra Engine will load any of these types of files, it's best to use the second option, *glTF Separate*. This will allow easy access to the glTF data and texture files.

5. Click the "Export" button to save your model in *glTF format*. Your exported glTF file can be loaded directly into Ultra Engine.

## Compressed Textures

Most glTF files will store textures in PNG images. JPEG is also supported, but should not be used due compression artifacts. glTF does not natively support memory-compressed texture formats, but does support the [Microsoft DDS](https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Vendor/MSFT_texture_dds) and [Basis](https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos/KHR_texture_basisu) formats through two file format extensions.

You can convert glTF textures to DDS or Basis in the Ultra Engine editor. Open the glTF file you want to modify and select the *Tools > Convert Textures to DDS* or *Convert Textures to Basis* menu item. This will save all PNG and JPEG images the model uses to the optimized format and reassign these files to the materials. You can then save the glTF file and the optimized texture files will be specified in the new file. The unoptimized PNG and JPEG images will be kept as well, so that your glTF file can be loaded in programs that do not support the required extensions.

glTF files can also be opened in a text editor and modified by hand to add the optimized texture files, without too much trouble:

```json
"textures": [
    {
        "source": 0,
        "extensions": {
            "MSFT_texture_dds": {
                "source": 1
            }
        }
    }
],
"images": [
    {
        "uri": "defaultTexture.png"
    },
    {
        "uri": "DDSTexture.dds"
    }
]
```

## Additional Information

- [glTF 2.0 in Blender](https://docs.blender.org/manual/en/2.80/addons/io_scene_gltf2.html)
- [glTF Support in 3ds Max](https://help.autodesk.com/view/3DSMAX/2023/ENU/?guid=GUID-5B4C8EC2-2230-4F9F-B3C6-48D9E347E37D)
