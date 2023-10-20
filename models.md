# 3D Modeling Pipeline

Ultra Engine natively supports loading and saving of [Khronos glTF](https://www.khronos.org/gltf/) and Wavefront OBJ files. Support for additional model file formats can be added through the [plugin](Plugin.md) system.

## glTF Models

Khronos glTF is the recommended 3D model file format to use. It supports hierarchies, PBR materials, animation, and other features. The format loads quickly and is easily accessible in a variety of 3D modeling programs.

### glTF Export from Blender

To export your models to glTF format from Blender, follow these steps:

1. Open your model in Blender.

2. Go to `File` > `Export` > `Export as` and choose the glTF format (`.glb` or `.gltf`).

3. Configure the export settings according to your requirements, including options for materials, animations, and other parameters.

4. Click the "Export" button to save your model in glTF format.

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
