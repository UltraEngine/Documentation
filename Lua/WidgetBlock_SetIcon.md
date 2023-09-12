## WidgetBlock:SetIcon

This method allows you to dynamically modify the icon a widget block displays. This can be more efficient than clearing and re-creating all widget blocks.

### Syntax

```lua
WidgetBlock:SetIcon(icon)
```

### Parameters

| Parameter | Description |
| --- | --- |
| icon | new icon to display |

## Example

```lua
local myIcon = Icon:new()
myIcon:LoadFromFile("icon.png")

local myWidgetBlock = WidgetBlock:new()
myWidgetBlock:SetIcon(myIcon)
```