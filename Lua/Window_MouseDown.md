## Window.MouseDown

Returns the current press state of the specified mouse button.

### Syntax

```lua
local result = Window.MouseDown(button)
```

- `result`: A boolean value indicating whether the specified mouse button is currently pressed.
- `button`: The mouse button to test, can be `MOUSE_LEFT`, `MOUSE_RIGHT`, or `MOUSE_MIDDLE`.

### Returns

Returns `true` if the specified mouse button is currently pressed, otherwise `false` is returned.

### Example

```lua
-------------------------------------------------------------------------------------------------
--
-- This example uses the left mouse button to control the color of a panel widget.
--
-------------------------------------------------------------------------------------------------

-- Get the displays
local displays = GetDisplays()

-- Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

-- Create user interface
local ui = CreateInterface(window)

while true do
    if window:MouseDown(MOUSE_LEFT) then
        ui.root:SetColor(1, 0, 0, 1)
    else
        ui.root:SetColor(0, 0, 0, 1)
    end

    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end

return 0
```