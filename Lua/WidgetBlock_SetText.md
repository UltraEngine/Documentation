# WidgetBlock:SetText

This method allows you to dynamically modify the text a widget block displays. This can be more efficient than clearing and re-creating all widget blocks.

## Syntax

```lua
WidgetBlock:SetText(text)
```

## Parameters

| Parameter | Description |
| --- | --- |
| text | new text to display |

## Example

```lua
local block = WidgetBlock()
block:SetText("Hello, Lua!")
```