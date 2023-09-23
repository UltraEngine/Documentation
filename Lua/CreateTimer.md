# CreateTimer

This function creates a new timer object. A timer emits a TIMERTICK event at a regular frequency. The event source will be the timer object, and the event data value will be the timer tick count.

## Syntax

- [Timer](Timer.md) **CreateTimer**(number frequency)

| Parameter | Description |
| --- | --- |
| frequency | timer frequency in milliseconds |

## Returns

Returns a new timer object.

## Example

```lua
local displays = GetDisplays()

local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_CENTER)

local ui = CreateInterface(window)

local sz = ui.background:ClientSize()

local label = CreateLabel("", 0, 0, sz.x, sz.y, ui.background, LABEL_CENTER | LABEL_MIDDLE)
label:SetFontScale(4)

local timer = CreateTimer(1000)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_TIMERTICK then
        label:SetText(tostring(ev.data))
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
