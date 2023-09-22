# Interface:SetScale

This method sets the DPI scaling value of an interface.

## Syntax

- **Interface:SetScale**(number scale)

| Parameter | Description |
| --- | --- |
| scale | DPI scaling value to set |

## Remarks

Because computer displays vary in pixel density, it is helpful to display your application with scaling for the current user settings. It's best to create your application interface assuming 100% scaling, and then apply scaling. You can also create new widgets after scaling is applied, and multiply their coordinates by the current scaling factor.

If you make all widget positions and sizes a multiple of 4, all coordinates will scale to an exact integer and provide a better appearance.

## Example

```lua
---------------------------------------------------------------------------------------------------
--
-- This example demonstrates an easy way to handle DPI scaling for resolution-independent interfaces.
-- The user interface is created using 100 scaling and then the interface is rescaled if the display
-- scale is not 100%. The program listens for additional window DPI scale change events in case the user
-- changes this value in the system settings while this program is running.
-- 
---------------------------------------------------------------------------------------------------

--Hook function
function Callback(ev, extra)
    
    --Resize window if desired
    local window = Window(ev.source)
    window:SetShape(ev.position, ev.size)

    --Get the user interface
    local ui = Interface(extra)
    ui:SetScale( ev.data / 100)

    return true
end

-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)
window:SetMinSize(640, 480)

-- Create user interface
local ui = CreateInterface(window)

-- Create widgets
local sz = ui.background:ClientSize()

local leftpanel = CreatePanel(10, 10, 200, sz.y - 20, ui.background)
leftpanel:SetLayout(1, 0, 1, 1)
leftpanel:SetColor(0, 0, 0, 1)

local rightpanel = CreatePanel(sz.x - 10 - 200, 10, 200, sz.y - 20, ui.background)
rightpanel:SetLayout(0, 1, 1, 1)
rightpanel:SetColor(0, 0, 0, 1)

local mainpanel = CreatePanel(10 + 200 + 10, 10, sz.x - 10 * 4 - 200 * 2, sz.y - 10 * 3 - 100, ui.background)
mainpanel:SetLayout(1, 1, 1, 1)
mainpanel:SetColor(0, 0, 0, 1)

local bottompanel = CreatePanel(10 + 200 + 10, sz.y - 10 - 100, sz.x - 10 * 4 - 200 * 2, 100, ui.background)
bottompanel:SetLayout(1, 1, 0, 1)
bottompanel:SetColor(0, 0, 0, 1)

ListenEvent(EVENT_WINDOWDPICHANGED, window, Callback, ui)

-- Trigger a rescale if the display scale is not 100%
if displays[1].scale ~= 1.0 then
    EmitEvent(EVENT_WINDOWDPICHANGED, window, displays[1].scale * 100, 0, 0, 800 * displays[1].scale, 600 * displays[1].scale)
end

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE and ev.source == window then
        break
    end
end
```
