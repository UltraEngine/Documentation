# Texture::BuildMipmaps

This method will create a new mipmap chain from the base image level. The texture must have been created with the TEXTURE_MIPMAPS flag to generate mipmaps.

## Syntax

- void **BuildMipmaps**()
- void **BuildMipmaps**(const int layer)

| Paramter | Description |
|---|---|
| layer | texture layer or cubemap face to build, or all layers if not specified |
