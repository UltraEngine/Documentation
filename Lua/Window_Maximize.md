# Window:Maximize

This function maximizes the window to fill the entire desktop client area.

## Syntax

```lua
function Window:Maximize()
```

## Remarks

The window should be created with the `WINDOW_RESIZABLE` style flag included.

## Example

```lua
local UltraEngine = require("UltraEngine")

-- Get the displays
local displays = UltraEngine.GetDisplays()

-- Create windows
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0], UltraEngine.WINDOW_TITLEBAR | UltraEngine.WINDOW_RESIZABLE)

-- Create user interface
local ui = UltraEngine.CreateInterface(window)

-- Maximize window
window:Maximize()

while true do
    local ev = UltraEngine.WaitEvent()
    if ev.id == UltraEngine.EVENT_WINDOWCLOSE then
        break
    end
end
```