# Window:MouseHit

Returns true if the specified mouse button has been pressed since the last call to the method, or since the creation of the window.

Syntax
```
bool Window:MouseHit(MouseButton button)
```

Parameters:
- **button** (MouseButton): mouse button to test, can be `MOUSE_LEFT`, `MOUSE_RIGHT`, or `MOUSE_MIDDLE`

Returns:
- (boolean) Returns true if the specified mouse button has been pressed, otherwise false is returned.

Remarks:
This method uses a global state to track whether any `MOUSEDOWN` events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the button was pressed. The event system should be used for finer control over mouse input.

Example
```lua
-------------------------------------------------------------------------------------------------
--
-- This example uses the left mouse button to control the color of a panel widget.
--
-------------------------------------------------------------------------------------------------

-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[1])

-- Create user interface
local ui = CreateInterface(window)

while (true) do
    if (window:MouseHit(MOUSE_LEFT)) then
        ui.root:SetColor(Random(1.0), Random(1.0), Random(1.0), 1)
    end

    local ev = WaitEvent()
    if (ev.id == EVENT_WINDOWCLOSE) then
        return 0
    end
end

return 0
```
