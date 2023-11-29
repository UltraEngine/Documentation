# Font

**Base class:** [Asset](Asset.md)

This class provides an interface for loading and rasterizing fonts for text drawing. Once a font is loaded, a [Sprite](Sprite.md) can be created to display text on the screen.

| Property | Type | Description |
| ----- | ----- | ----- |
| [GetTextWidth](Font_GetTextWidth.md) | Method | returns the width in pixels of the specified text when rendered with this font. |
| [GetHeight](Font_GetHeight.md) | Method | returns the height in pixels of a line of text with this font |
| [LoadFont](LoadFont.md) | Function | loads a font from a True-type font (TTF) file. |

```csharp
public class Font : Asset
{
    public int GetTextWidth(string text)
    {
        // returns the width in pixels of the specified text when rendered with this font
    }
    
    public int GetHeight()
    {
        // returns the height in pixels of a line of text with this font
    }
    
    public static Font LoadFont(string filename)
    {
        // loads a font from a True-type font (TTF) file
    }
}
```