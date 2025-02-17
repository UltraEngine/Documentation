# Sprite

**Base class:** [Entity](Entity.md)

This class provides 2D shapes and images on the screen.

| Property | Type | Description |
| --- | --- | --- |
| mesh | readonly [Mesh](Mesh.md) | read-only mesh object |
| [SetViewMode](Sprite_SetViewMode.md) | Method | sets the sprite auto-orientation setting |
| [CreateSprite](CreateSprite.md) | Function | creates a new sprite object |
| [LoadSprite](LoadSprite.md) | Function | loads a texture and applies it to a new sprite |

## Example

```csharp
Sprite sprite = new Sprite();
sprite.SetViewMode(SpriteViewMode.Auto);
sprite.CreateSprite();
sprite.LoadSprite("texture.png");
```