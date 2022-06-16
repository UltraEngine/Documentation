# Textures

## File Formats

Textures can be loaded from DDS files, or a variety of files using the FreeImage texture plugin, including PNG, JPEG, BMP, TGA, PCX, GIF, and PSD. Leadwerks TEX files can be loaded using the Leadwerks plugin.

DDS textures are generally recommended because they support stored mipmaps and compression, but many glTF files store texture data in PNG or JPEG format, and will require the FreeImage texture plugin to load correctly. Ultra Engine can load and save DDS files in glTF models using Microsoft's [MSFT_texture_dds](https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Vendor/MSFT_texture_dds) glTF extension.

Other file formats can be loaded if a plugin exists for that format.

## Texture Mapping



## Mipmaps

## Edge Clamp



## Filter

Textures can use linear or nearest filtering. Linear filtering should be used for most textures.

## Pixel Formats


### Compressed Textures

BC7 compression format is recommended for most color texture files.

BC5 stores two channels with higher precision, which makes it ideal for normal maps. You should not use any other compression format with normal maps.

BC4 stores a single channel at higher precision, making this format the most suitable for displacement maps.

## Cubemaps


## Volume Textures

