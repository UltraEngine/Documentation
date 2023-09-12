# Widget.SetShape

This method sets the widget position and height.

## Syntax

- **Widget:SetShape**(x, y, width, height)
- **Widget:SetShape**(position, size)

| Parameter | Description |
| --- | --- |
| x | X component of the widget position |
| y | Y component of the widget position |
| width | X component of the widget size |
| height | Y component of the widget size |
| position | widget position to set |
| size | widget size to set |

## Example

```lua
-- Load plugins
local plugin_svg = LoadPlugin("Plugins/SVG.*")

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()

-- Create widget
local panel = CreatePanel(50, 50, sz.x - 100, sz.y - 100, ui.root)
panel:SetColor(0, 0, 0, 1)

-- Set the shape
panel:SetShape(10, 10, 200, 200)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```