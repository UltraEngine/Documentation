# Texture:BuildMipmaps

This method will create a new mipmap chain from the base image level. The texture must have been created with the `TEXTURE_MIPMAPS` flag to generate mipmaps.

## Syntax

- **Texture:BuildMipmaps**()
- **Texture:BuildMipmaps**(layer)

## Parameters

| Parameter | Description |
|---|---|
| layer | The texture layer or cubemap face to build. If not specified, all layers will be built. |