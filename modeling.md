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

5. Click the "Export" button to save your model in *glTF format*.

### glTF Export from 3ds Max

To export your models to glTF format from 3ds Max, you can use the following steps:

1. Open your model in 3ds Max.

2. Navigate to `File` > `Export` and select the glTF format (`.glb` or `.gltf`) as the export option.

3. Adjust the export settings as needed, such as specifying materials, animations, and other relevant options.

4. Click the "Export" button to save your model in glTF format.

## glTF Materials

Understanding how to work with glTF materials in your 3D modeling software is crucial for achieving the desired visual effects in Ultra Engine.

### glTF Materials in Blender

When working with glTF materials in Blender, make sure to:

- Assign the appropriate PBR materials to your model.
- Configure textures, roughness, metalness, and other material properties to ensure realistic rendering.
- Pay attention to material naming conventions to simplify the import process in Ultra Engine.

### glTF Materials in 3ds Max

For 3ds Max, consider the following when working with glTF materials:

- Ensure that your materials are set up with the correct PBR attributes.
- Apply textures and adjust parameters like roughness and metalness to achieve the desired appearance.
- Be mindful of material naming conventions to streamline the import process in Ultra Engine.

By mastering the use of glTF models and materials in your preferred 3D modeling software, you can take full advantage of Ultra Engine's capabilities for creating immersive 3D environments and experiences.


For additional Blender info: https://docs.blender.org/manual/en/2.80/addons/io_scene_gltf2.html

3ds max: https://help.autodesk.com/view/3DSMAX/2023/ENU/?guid=GUID-5B4C8EC2-2230-4F9F-B3C6-48D9E347E37D
