# Widget:SetProgress

This method sets the progress complete to display, for a progress bar widget.

## Syntax

- **SetProgress**(number progress)

| Parameter | Description |
| --- | --- |
| progress | progress complete, in the range from 0 to 1 |

## Example

```lua
function UpdateProgress(e, extra)
    local widget = Widget(extra)
    local i
    local f
    i, f = math.modf(e.data / 20)
    widget:SetProgress(f)
    return true
end

-- Get the displays
local displays = GetDisplays()

-- Create a window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = CreateInterface(window)

-- Create widget
local sz = ui.background:GetSize()
local widget = CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui.background)

local progresstimer = CreateTimer(500)
ListenEvent(EVENT_TIMERTICK, progresstimer, UpdateProgress, widget)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
