# Window:MouseDown

Returns the current press state of the specified mouse button.

## Syntax

- boolean **MouseDown**(number button)

| Parameter | Description |
|---|---|
| button |  The mouse button to test, can be MOUSE_LEFT, `MOUSE_RIGHT, or MOUSE_MIDDLE. |

## Returns

Returns true if the specified mouse button is currently pressed, otherwise false is returned.

## Example

```lua
-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

while true do

    if window:MouseDown(MOUSE_LEFT) then
        Notify("Mouse pressed")
    end

    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```
