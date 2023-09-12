# Font

**Base class:** `Asset`

This class provides an interface for loading and rasterizing fonts for text drawing. Once a font is loaded, a `Sprite` can be created to display text on the screen.

## Properties

| Property | Type | Description |
| -------- | ---- | ----------- |
| [GetTextWidth](#gettextwidth) | Method | Returns the width in pixels of the specified text when rendered with this font. |
| [GetHeight](#getheight) | Method | Returns the height in pixels of a line of text with this font. |
| [LoadFont](#loadfont) | Function | Loads a font from a True-type font (TTF) file. |

## Methods

### <a name="gettextwidth"></a>GetTextWidth

```lua
function Font:GetTextWidth(text)
```

Returns the width in pixels of the specified `text` when rendered with this font.

#### Parameters

- `text` (`string`): The text to measure.

#### Returns

- `number`: The width of the text in pixels.

### <a name="getheight"></a>GetHeight

```lua
function Font:GetHeight()
```

Returns the height in pixels of a line of text with this font.

#### Returns

- `number`: The height of a line of text in pixels.

## Functions

### <a name="loadfont"></a>LoadFont

```lua
function LoadFont(filepath, size)
```

Loads a font from a True-type font (TTF) file.

#### Parameters

- `filepath` (`string`): The path to the TTF file.
- `size` (`number`): The desired font size.

#### Returns

- `Font`: The loaded font.