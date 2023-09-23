# Window:KeyDown

Returns the current key state of the specified key.

## Syntax

- boolean **KeyDown**(number key)

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

-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

--Create user interface
local ui = CreateInterface(window)

while true do
    if window:KeyDown(KEY_SPACE) then
        ui.background:SetColor(1, 0, 0, 1)
    else
        ui.background:SetColor(0, 0, 0, 1)
    end

    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return
    end
end
```
