# Window.KeyDown

Returns the current key state of the specified key.

## Syntax

- **Window:KeyDown**(key: KeyCode): boolean

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key is currently pressed, otherwise false is returned.

## Example

```lua
-------------------------------------------------------------------------------------------------
--
-- This example uses the space key to control the color of a panel widget.
--
-------------------------------------------------------------------------------------------------

-- import required libraries
local ultra = require("UltraEngine")

-- Get the displays
local displays = ultra.GetDisplays()

-- Create windows
local window = ultra.CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create user interface
local ui = ultra.CreateInterface(window)

while true do
    if window:KeyDown(ultra.KEY_SPACE) then
        ui.root:SetColor(1, 0, 0, 1)
    else
        ui.root:SetColor(0, 0, 0, 1)
    end

    local ev = ultra.WaitEvent()
    if ev.id == ultra.EVENT_WINDOWCLOSE then
        return 0
    end
end
```