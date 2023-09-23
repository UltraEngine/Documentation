# Window:Minimize

This method minimizes the window to the desktop taskbar.

## Syntax

- **Minimize**()

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1], WINDOW_TITLEBAR | WINDOW_RESIZABLE)

-- Create user interface
local ui = CreateInterface(window)

-- Maximize window
window:Minimize()

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return
    end
end
```

Assuming the required libraries are imported to Lua.
