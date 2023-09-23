# Window:Activate

This method makes the window gain the keyboard focus and brings it to the top of the window order.

## Syntax

- **Activate**()

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window1 = CreateWindow("Window 1", 0, 0, 640, 480, displays[1], WINDOW_TITLEBAR)

local window2 = CreateWindow("Window 2", 200, 200, 640, 480, displays[1], WINDOW_TITLEBAR)

window1:Activate()

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return
    end
end
```
