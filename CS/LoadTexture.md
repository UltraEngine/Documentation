# LoadTexture

This function loads a texture from a file path or stream.

## Syntax

- `Texture LoadTexture(string path, LoadFlags flags = LOAD_DEFAULT)`
- `Texture LoadTexture(Stream stream, LoadFlags flags = LOAD_DEFAULT)`

| Parameter | Description |
|---|---|
| path | file path to load the pixmap from |
| stream | stream to load the pixmap from |
| flags | optional load flags |

## Returns

Returns the loaded texture, or `null` if no texture was loaded.

## Remarks

Ultra Engine natively supports the DDS and Leadwerks TEX texture file formats. The FITextureLoader plugin supports JPEG, PNG, TGA, GIF, and HDR files.

If the `LOAD_MIPCHAIN` LoadFlag is included, the texture mipmaps will be loaded into the mipchain member of the texture.

## Example

```csharp
Texture texture = LoadTexture("path/to/file.png");
```

```csharp
Stream stream = GetStreamFromSomewhere();
Texture texture = LoadTexture(stream, LoadFlags.LOAD_DEFAULT);
```