# WidgetBlock

This class is used by a [custom widget](CustomWidgets.md) to define a rectangle, image, or a block of text.

| Property | Type | Description |
| --- | --- | --- |
| color | [Vec4](Vec4.md) | block color |
| gradient | float | vertical gradient multiplier |
| position | [iVec2](iVec2.md) | block position |
| radius | int | corner radius |
| size | [iVec2](iVec2.md) | block width and height |
| text | [WString](WString.md) | read-only block text |
| [SetIcon](WidgetBlock_SetIcon.md) | Method | defines an icon to display |
| [SetPixmap](WidgetBlock_SetPixmap.md) | Method | defines a pixmap to display |
| [SetText](WidgetBlock_SetText.md) | Method | defines a string of text to display |

## Syntax

```csharp
class WidgetBlock
{
    public Vec4 color;
    public float gradient;
    public iVec2 position;
    public int radius;
    public iVec2 size;
    public WString text;

    public void SetIcon(Icon icon);
    public void SetPixmap(Pixmap pixmap);
    public void SetText(string text);
}
```

## Example

```csharp
WidgetBlock widgetBlock = new WidgetBlock();
widgetBlock.color = new Vec4(1f, 0.5f, 0f, 1f);
widgetBlock.gradient = 0.5f;
widgetBlock.position = new iVec2(100, 100);
widgetBlock.radius = 10;
widgetBlock.size = new iVec2(200, 100);
widgetBlock.SetText("Hello, World!");

Icon icon = LoadIcon("icon.png");
widgetBlock.SetIcon(icon);

Pixmap pixmap = LoadPixmap("image.png");
widgetBlock.SetPixmap(pixmap);
```