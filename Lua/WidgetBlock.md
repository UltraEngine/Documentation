# WidgetBlock

This class is used by a custom widget to define a rectangle, image, or a block of text.

| Property | Type | Description |
| --- | --- | --- |
| color | Vec4 | block color |
| gradient | number | vertical gradient multiplier |
| position | iVec2 | block position |
| radius | number | corner radius |
| size | iVec2 | block width and height |
| text | WString | read-only block text |
| `SetIcon()` | Method | defines an icon to display |
| `SetPixmap()` | Method | defines a pixmap to display |
| `SetText()` | Method | defines a string of text to display |

## WidgetBlock:SetIcon()

```lua
function WidgetBlock:SetIcon(icon)
    -- code to define an icon to display
end
```

Defines an icon to display for the widget block.

### Parameters
- `icon` (any): the icon to be displayed

## WidgetBlock:SetPixmap()

```lua
function WidgetBlock:SetPixmap(pixmap)
    -- code to define a pixmap to display
end
```

Defines a pixmap to display for the widget block.

### Parameters
- `pixmap` (any): the pixmap to be displayed

## WidgetBlock:SetText()

```lua
function WidgetBlock:SetText(text)
    -- code to define a string of text to display
end
```

Defines a string of text to display for the widget block.

### Parameters
- `text` (string): the text to be displayed