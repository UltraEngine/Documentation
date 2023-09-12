# Window:KeyHit

Returns true if the specified key has been pressed since the last call to KeyHit, or since the creation of the window.

## Syntax

    Window:KeyHit(key)

### Parameters

- `key` (number): code of the key to check the state of

## Returns

Returns true if the specified key has been pressed, otherwise false is returned.

## Remarks

This method uses a global state to track whether any KEYDOWN events have occurred since the last call. If two different parts of your program both call this method, only one of them will detect that the key was pressed. The event system should be used for finer control over keyboard input.

## Example

This example uses the space key to control the color of a panel widget.

```lua
-------------------------------------------------------------------------------------------------
--
-- This example uses the space key to control the color of a panel widget.
--
-------------------------------------------------------------------------------------------------

--Get the displays
local displays = GetDisplays()

--Create windows
local window = CreateWindow("Ultra Engine", 0, 0, 800, 600, displays[0])

--Create user interface
local ui = CreateInterface(window)

while true do
    if window:KeyHit(KEY_SPACE) then
        ui.root:SetColor(Random(1.0), Random(1.0), Random(1.0), 1)
    end

    local ev = WaitEvent()
    if ev.id == EVENT_WINDOWCLOSE then
        return 0
    end
end
```