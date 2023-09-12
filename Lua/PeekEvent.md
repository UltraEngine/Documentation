# PeekEvent

This function returns true if any events are available in the event queue.

## Syntax

```lua
function PeekEvent() -> boolean
```

## Remarks

Most GUI applications will use an event-driven design. Occasionally you may need to perform real-time operations (such as rendering). This method provides a mechanism to incorporate events into such an application.

## Returns

Returns true if the event queue has any events waiting, otherwise false is returned.

## Example

```lua
--Get the displays
local displays = GetDisplays()

--Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create user interface
local ui = CreateInterface(window)

while true do
    local r = Sin(Millisecs() / 20.0) * 0.5 + 0.5
    ui.root:SetColor(r, r, r, 1)
    Sleep(1)
    while PeekEvent() do
        local ev = WaitEvent()
        if ev.id == EVENT_WINDOWCLOSE and ev.source == window then
            return 0
        end
    end
end
```
