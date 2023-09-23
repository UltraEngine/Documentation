# Window:SetMousePosition

This method moves the mouse pointer to the specified window coordinate.

## Syntax

- **SetMousePosition**(number x, number y)
- **SetMousePosition**([iVec2](iVec2.md) coords)

| Parameter | Description |
|---|---|
| coords, (x, y) | mouse coordinate to set |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()
local panel = CreatePanel(100, 100, sz.x - 200, sz.y - 200, ui.background)
panel:SetColor(0, 0, 0, 1)
panel:SetCursor(CURSOR_CROSS)
local label = CreateLabel("Click on the black panel to center the mouse", 0, 43, sz.x, 30, ui.background, LABEL_CENTER)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_MOUSEDOWN then
        if ev.source == panel then
            local pos = panel.position
            local sz = panel.size
            window:SetMousePosition(pos.x + sz.x / 2, pos.y + sz.y / 2)
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```
