# Window:SetHidden

This method hides a window.

## Syntax

- **SetHidden**(boolean hide)

| Parameter | Description |
|---|---|
| hide | window visibility |

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Parent window", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)
local sz = ui.background:ClientSize()
local button = CreateButton("Show child window", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.background)

-- Create subwindow
local subwindow = CreateWindow("Child window", 200, 200, 400, 300, window, WINDOW_TITLEBAR | WINDOW_HIDDEN)
local subui = CreateInterface(subwindow)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION then
        if ev.source == button then
            subwindow:SetHidden(false)
            subwindow:Activate()
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        if ev.source == window then
            return 0
        elseif ev.source == subwindow then
            subwindow:SetHidden(true)
        end
    end
end
```
