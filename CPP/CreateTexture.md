# CreateTexture

## Syntax

- shared_ptr<Texture> **CreateTexture**(TextureType type, int width, int height, TextureFormat format, const std::vector<shared_ptr<Pixmap> > mipchain = {}, int layers = 1, const TextureFlags = TEXTURE_DEFAULT, TextureFilter filter = TEXTUREFILTER_LINEAR, const int samples = 0)
  
| Parameter | Description |
| --- | --- |
| flags | Can be any combination of TEXTURE_CLAMP_U, TEXTURE_CLAMP_V, 
  
  
## Remarks

The texture flags can be any of the following

| TextureFLag | Description |
|---|---|
| TEXTURE_CLAMP_U | Clamps the texture on the U axis |
| TEXTURE_BUFFER | Texture can be rendered to |
| TEXTURE_SHADOW | Depth compare mode is used... |  
