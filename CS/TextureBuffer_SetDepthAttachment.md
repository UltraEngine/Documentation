# TextureBuffer.SetDepthAttachment

This method sets a texture buffer's depth texture.

## Syntax

```csharp
bool SetDepthAttachment(Texture texture)
```

| Parameter | Description |
|---|---|
| texture | depth attachment to set |

## Returns

Returns true if the depth attachment is set, otherwise false is returned.

## Remarks

The specified texture must use a renderable depth format.

The specified texture must have been created with the TEXTURE_BUFFER flag.

The specified texture must be the same dimensions as the texture buffer.

## Example

```csharp
Texture depthTexture = new Texture();
// Set texture properties
...

bool isSet = TextureBuffer.SetDepthAttachment(depthTexture);
if (isSet)
{
    Console.WriteLine("Depth attachment set successfully.");
}
else
{
    Console.WriteLine("Failed to set depth attachment.");
}
```