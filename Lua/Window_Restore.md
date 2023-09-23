# Window:Restore

This method restores a window that is minimized or maximized to its previous position and size.

## Syntax

- **Restore**()

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

--Create user interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()
local button = CreateButton("Toggle Window", sz.x / 2 - 50, sz.y / 2 - 15, 100, 30, ui.background)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWSIZE then
        sz = ui.background:ClientSize()
        button:SetShape(sz.x / 2 - 50, sz.y / 2 - 15, 100, 30)
    elseif ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            if window:Maximized() then
                window:Restore()
            else
                window:Maximize()
            end
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
