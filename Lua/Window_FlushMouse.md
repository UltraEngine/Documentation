# Window:FlushMouse

This method resets the mouse button states, the mouse wheel position, and the raw mouse movement.

## Syntax

- **FlushMouse**()

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()
local label = CreateLabel("Click on the window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.background)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_MOUSEDOWN then
        if ev.source == window then
            
            -- This call to FlushMouse() resets the mouse hit state so it will not be detected:
            window:FlushMouse()

            Notify("MouseHit: " .. tostring(window:MouseHit(MOUSE_LEFT)))
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
