# Widget:SetProgress #

This method sets the progress complete to display, for a progress bar widget.

## Syntax ##
- **SetProgress**(progress: number)

| Parameter | Description |
| --- | --- |
| progress | progress complete, in the range from 0 to 1 |

## Example

```lua
-- Import required libraries
require "UltraEngine"

function UpdateProgress(e, extra)
    local widget = extra:AsWidget()
    widget:SetProgress(math.modf(e.data / 20.0, 1.0))
    return true
end

-- Get the displays
local displays = UltraEngine.GetDisplays()

-- Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create User Interface
local ui = UltraEngine.CreateInterface(window)

-- Create widget
local sz = ui.root:GetSize()
local widget = UltraEngine.CreateProgressBar(20, (sz.y - 30) / 2, sz.x - 40, 30, ui.root)
widget:SetProgress(0.6)

local progresstimer = UltraEngine.CreateTimer(500)
UltraEngine.ListenEvent(EVENT_TIMERTICK, progresstimer, UpdateProgress, widget)

while true do
    local ev = UltraEngine.WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```