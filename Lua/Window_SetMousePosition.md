# Window:SetMousePosition

This method moves the mouse pointer to the specified window coordinate.

## Syntax

- **SetMousePosition**(x: integer, y: integer)
- **SetMousePosition**(coords: [iVec2](iVec2.md))

### Parameters

- **x**: The X component of the destination coordinates.
- **y**: The Y component of the destination coordinates.
- **coords**: The destination coordinates.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create user interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()
local panel = CreatePanel(100, 100, sz.x - 200, sz.y - 200, ui.root)
panel:SetColor(0, 0, 0, 1)
panel:SetPointer(POINTER_CROSS)
local label = CreateLabel("Click on the black panel to center the mouse", 0, 43, sz.x, 30, ui.root, LABEL_CENTER)

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