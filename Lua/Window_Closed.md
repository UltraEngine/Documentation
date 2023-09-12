# Window:Closed

This method returns true if the window has been closed since the last call, or since the creation of the window.

## Syntax

```lua
function Window:Closed()
```

## Returns

Returns the window closed state and resets the state to false.

## Remarks

This method uses a global state to detect when the window has been closed. If two different parts of your application call the method, only one will detect the close event. For finer control, use the events system and listen for `WINDOWCLOSE` events.

## Example

```lua
require("UltraEngine")

-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

local sz = ui.root:ClientSize()
local button = CreateButton("Close", sz.x / 2 - 40, sz.y / 2 - 15, 80, 30, ui.root)

while not window:Closed() do
    local ev = WaitEvent()
    if ev.id == EVENT_WIDGETACTION and ev.source == button then
        window:Close()
    end
end
```