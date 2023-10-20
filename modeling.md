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

Although Ultra Engine will load any of these types of files, you should always use the second option, glTF Separate.

5. Click the "Export" button to save your model in *glTF format*. Your exported glTF file can be loaded directly into Ultra Engine.

For additional Blender info: https://docs.blender.org/manual/en/2.80/addons/io_scene_gltf2.html

3ds max: https://help.autodesk.com/view/3DSMAX/2023/ENU/?guid=GUID-5B4C8EC2-2230-4F9F-B3C6-48D9E347E37D
