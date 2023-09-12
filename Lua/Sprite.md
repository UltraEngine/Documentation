# Sprite

**Base class:** [Entity](Entity.md)

This class provides 2D shapes and images on the screen.

| Property | Type | Description |
| --- | --- | --- |
| mesh | userdata | A read-only mesh object |
| SetViewMode | Function | Sets the sprite auto-orientation setting |
| CreateSprite | Function | Creates a new sprite object |
| LoadSprite | Function | Loads a texture and applies it to a new sprite |

## Sprite.SetViewMode()

```lua
Sprite:SetViewMode(mode)
```

Sets the sprite auto-orientation setting.

**Parameters**
- **mode**: number - The auto-orientation mode for the sprite. Valid values are:
  - 0: The sprite's orientation matches the camera's orientation.
  - 1: The sprite's orientation is fixed in the screen space.

## CreateSprite(width, height)

```lua
local sprite = CreateSprite(width, height)
```

Creates a new sprite object with the specified width and height.

**Parameters**
- **width**: number - The width of the sprite.
- **height**: number - The height of the sprite.

**Returns**
- userdata - The newly created sprite object.

## LoadSprite(texturePath)

```lua
local sprite = LoadSprite(texturePath)
```

Loads a texture from the specified file path and applies it to a new sprite object.

**Parameters**
- **texturePath**: string - The file path of the texture.

**Returns**
- userdata - The newly created sprite object.