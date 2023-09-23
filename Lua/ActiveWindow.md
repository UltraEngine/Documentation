# ActiveWindow

This function returns the focused application window.

## Syntax

[Window](Window.md) **ActiveWindow**()

## Returns

Returns the focused window, or nil if no application window has the focus.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create windows
local window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR)
local window2 = CreateWindow("Window 2 (Active)", 200, 200, 640, 480, displays[1], WINDOW_TITLEBAR)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWSELECT then
        active = ActiveWindow()
        if active == window1 then
            window1:SetText("Window 1 (Active)")
            window2:SetText("Window 2")
        elseif active == window2 then
            window1:SetText("Window 1")
            window2:SetText("Window 2 (Active)")
        else
            window1:SetText("Window 1")
            window2:SetText("Window 2")
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```
