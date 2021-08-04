# CreateSprite

This function creates a sprite that displays a solid or wireframe rectangle.

## Syntax

- shared_ptr<[Sprite](Sprite.md)\> **CreateSprite**(shared_ptr<[Canvas](Canvas.md)\> canvas, const int width, const int height, const bool wireframe = false, const radius = 0.0f)

| Parameter | Description |
| --- | --- |
| canvas | canvas to add the sprite to |
| width | width of the sprite, in pixels |
| height | height of the sprite, in pixels |
| wireframe | set to true for wireframe or false for solid |
| radius | corner radius, for rounded rectangles |

## Returns

Returns a new sprite that displays a rectangle.
