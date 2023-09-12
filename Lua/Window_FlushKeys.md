# Window:FlushKeys

This method resets the key button states.

## Syntax

```lua
function Window:FlushKeys()
```

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create window
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)
local sz = ui.root:ClientSize()
local label = CreateLabel("Press space key", sz.x / 2 - 75, sz.y / 2 - 15, 150, 30, ui.root)

while true do
    local ev = WaitEvent()
    if ev.id == EVENT_KEYDOWN then
        if ev.source == window and ev.data == KEY_SPACE then
            -- This call to FlushKeys() resets the key hit state so it will not be detected
            window:FlushKeys()

            Notify("KeyHit: " .. tostring(window:KeyHit(KEY_SPACE)))
        end
    elseif ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```