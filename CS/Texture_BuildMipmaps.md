# Texture.BuildMipmaps

This method will create a new mipmap chain from the base image level. The texture must have been created with the TEXTURE_MIPMAPS flag to generate mipmaps.

## Syntax

- void **BuildMipmaps**()
- void **BuildMipmaps**(int layer)

| Paramter | Description |
|---|---|
| layer | texture layer or cubemap face to build, or all layers if not specified |

Example:

```csharp
Texture texture = new Texture(); // create a new texture
texture.BuildMipmaps(); // build mipmaps for all layers
```

```csharp
Texture texture = new Texture(); // create a new texture
int layer = 0; // specify a texture layer or cubemap face
texture.BuildMipmaps(layer); // build mipmaps for the specified layer
```