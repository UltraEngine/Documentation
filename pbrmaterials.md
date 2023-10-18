# PBR Materials and Lighting

Ultra Engine makes use of physically-based rendering to deliver next-gen visuals with realistic lighting. Several different settings in materials and the environment combine to produce the appearance of a surface.

Direct lighting is achieved with point, spot, directional, and box lights. These each use a different lighting equation to simulate a light source with texture-based shadows (shadow maps).

Indirect lighting is achieved through a set of world environment textures and smaller local environment probes. Because PBR materials accurately reflect the surrounding environment, it's important to have good reflection data.

## Creating Materials

PBR materials consist of many layers of data, compacted into different color channels, stored in different pixel formats. The easiest way to create materials is to let the editor do all the work for you. 

You can download free PBR images from a variety of websites including [ambientCG](https://www.ambientcg.com) and [Polyhaven](https://www.polyhaven.com). For this example, we will use a texture set that shows a rusted metallic surface.

[Download the texture pack](https://github.com/UltraEngine/Documentation/raw/master/Assets/Materials/pbrtextures.zip) and extract the contents into your Ultra Engine project. The extracted images will look like this:

![](https://github.com/UltraEngine/Documentation/blob/master/Images/pbrtextures.png?raw=true)

In the Ultra Engine editor, navigate to this folder in the [asset browser](assetbrowser.md). Right-click on the file *MetalPlates013_1K-PNG_Color.png*, select the *Generate Material* menu item, and wait a moment. The editor will identify the different image files, combine channels, and compress the images into opimized texture files.

![](https://github.com/UltraEngine/Documentation/blob/master/Images/pbrgenmaterial.png?raw=true)

If you open the resulting material file, you can see the textures have been combined to make a beautiful surface with interesting variation in its reflectivity and appearance.

![](https://github.com/UltraEngine/Documentation/blob/master/Images/pbrgenmaterial2.png?raw=true)

Here's what the material generation algorithm does:

- The base / diffuse map is converted into optimized BC7 format and saved as a DDS file.

- The normal map is converted into optimized BC5 format and saved as a DDS file. BC5 removes the Z-axis from the normal to make room for more data on the other two components, and the Z-axis will be reconstructed in the fragment shader. BC5 is the only compressed texture format that should be used with normal maps.

- If they are present, the metalness and roughness maps are combined into the green and blue channels of a single texture, and saved in BC7 format. If a metalness map is found, the material's metalness setting is set to 1.0.

- If an ambient occlusion map is present, and a metalness roughness map exists, the ambient occlusion data is packed into the red channel of the metalness / roughness map. Otherwise, the ambient occlusion map will be saved as a single texture in BC4 format, for compression of single-channel images.

- If a displacement map is found, it will be saved in an uncompressed single-channel image. Texture compression should never be used with displacement maps.

This would all be very time consuming to adjust by hand, but the built-in material generation tool can create optimized materials from raw images in just a few seconds. It does this by searching for common endings for file names and guessing which image goes where. You can modify these suffixes used by the material generation feature in the program options, in the *Material Generation* settings.

![](https://github.com/UltraEngine/Documentation/blob/master/Images/genmatsettings.png?raw=true)

## Material Settings

The most important setting for PBR materials are roughness and metalness.

### Roughness

The *roughness* setting indicates how rough a material's microsurface is. When a metal / roughness map is present, the roughness settings will act as a multiplier, so it should usually be set to 1.0 / 100%. If a metallic roughness map is not present, then this setting alone controls how rough the surface appears.

### Metalness

The *metalness* setting indicates how metallic a material is. When a metal / roughness map is present, the metalness settings will act as a multiplier, so it should usually be set to 1.0 / 100%. If a metallic roughness map is not present, then this setting alone controls how metallic the surface appears.

It's important to note that the more metallic a surface is, the more it depends on the surrounding environment to provide reflections. If a material is completely metal, but no environment maps have been set for the world, then the surface will appear black.

In practice, most of your basic materials without metal / roughness maps will use 100% roughness and 0% metalness.
