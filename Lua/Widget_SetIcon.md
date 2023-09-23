# Widget:SetIcon

This method adds an icon to the widget.

## Syntax

- **Seticon**([Icon](Icon.md) icon, number alignment = PIXMAP_CENTER, number scale = 1)

| Parameter | Description |
| --- | --- |
| icon | icon to set |
| alignment | pixmap alignment mode, may be PIXMAP_CENTER, PIXMAP_CONTAIN, PIXMAP_COVER, PIXMAP_STRETCH, or PIXMAP_FIT |
| scale | icon scale |

## Example

```lua
-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 800, displays[0])

-- Create a user interface
local ui = CreateInterface(window)

-- Load an icon
local icon = LoadIcon("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Logos/23.svg")

-- Show the icon
ui.root:SetIcon(icon)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
