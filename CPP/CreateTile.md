# CreateTile

This function creates a new tile for 2D drawing. Tiles can be rectangles or text.

## Syntax

- shared_ptr<[Tile](Tile,md)\> **CreateTile**(shared_ptr<[Camera](Camera.md)> camera, const float width, const float height, const bool wireframe = false)
- shared_ptr<[Tile](Tile,md)\> **CreateTile**(shared_ptr<[Camera](Camera.md)> camera, const [Vec2](Vec2.md)& size, const bool wireframe = false)
- shared_ptr<[Tile](Tile,md)\> **CreateTile**(shared_ptr<[Camera](Camera.md)> camera, shared_ptr<[Font](Font.md)> font, const int fontsize, const [WString](WString.md)& text, const TextAlignment alignment = TEXT_LEFT, const float linespacing = 1.5f)

| Parameter | Description |
|---|---|
| camera | camera the tile will appear on |
| size, width, height | size of a rectangle tile |
| wireframe | if set to true a line rectangle will be created, otherwise a solid rectangle will be created |
| font | font to create a text tile with |
| fontsize | font size to create a text tile with |
| alignment | text alignment, can be any combination of TEXT_LEFT, TEXT_CENTER, TEXT_RIGHT, TEXT_TOP, TEXT_MIDDLE, and TEXT_BOTTOM |
| linespacing | text spacing between multiple lines of text |

## Returns

Returns a new tile.
