# Window:Maximize

This function maximizes the window to fill the entire desktop client area.

## Syntax

- **Maximize**()

## Remarks

The window should be created with the WINDOW_RESIZABLE style flag included.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create user interface
local ui = CreateInterface(window)

-- Maximize window
window:Maximize()

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        break
    end
end
```
