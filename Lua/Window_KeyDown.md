# Window:KeyDown

Returns the current key state of the specified key.

## Syntax

- boolean **KeyDown**(number key)

| Parameter | Description |
|---|---|
| key | code of the key to check the state of |

## Returns

Returns true if the specified key is currently pressed, otherwise false is returned.

## Remarks

Any of the following key codes can be used in this command.

- KEY_LBUTTON
- KEY_RBUTTON
- KEY_MBUTTON
- KEY_XBUTTON1
- KEY_XBUTTON2
- KEY_BACKSPACE
- KEY_TAB
- KEY_ENTER
- KEY_SHIFT
- KEY_CONTROL
- KEY_ALT
- KEY_CAPSLOCK
- KEY_ESCAPE
- KEY_SPACE
- KEY_PAGEUP
- KEY_PAGEDOWN
- KEY_END
- KEY_HOME
- KEY_LEFT
- KEY_UP
- KEY_RIGHT
- KEY_DOWN
- KEY_INSERT
- KEY_DELETE
- KEY_D0
- KEY_D1
- KEY_D2
- KEY_D3
- KEY_D4
- KEY_D5
- KEY_D6
- KEY_D7
- KEY_D8
- KEY_D9
- KEY_A
- KEY_B
- KEY_C
- KEY_D
- KEY_E
- KEY_F
- KEY_G
- KEY_H
- KEY_I
- KEY_J
- KEY_K
- KEY_L
- KEY_M
- KEY_N
- KEY_O
- KEY_P
- KEY_Q
- KEY_R
- KEY_S
- KEY_T
- KEY_U
- KEY_V
- KEY_W
- KEY_X
- KEY_Y 
- KEY_Z
- KEY_COMMAND
- KEY_F1
- KEY_F2
- KEY_F3
- KEY_F4
- KEY_F5
- KEY_F6
- KEY_F7
- KEY_F8
- KEY_F9
- KEY_F10
- KEY_F11
- KEY_F12
- KEY_NUMLOCK
- KEY_SEMICOLON
- KEY_EQUALS
- KEY_COMMA
- KEY_SUBTRACT
- KEY_PERIOD
- KEY_SLASH
- KEY_TILDE
- KEY_OPENBRACKET
- KEY_BACKSLASH
- KEY_CLOSEBRACKET
- KEY_QUOTES
- KEY_NUMPAD0
- KEY_NUMPAD1
- KEY_NUMPAD2
- KEY_NUMPAD3
- KEY_NUMPAD4
- KEY_NUMPAD5
- KEY_NUMPAD6
- KEY_NUMPAD7
- KEY_NUMPAD8
- KEY_NUMPAD9
- KEY_NUMPADPERIOD
- KEY_NUMPADDIVIDE
- KEY_NUMPADMULTIPLY
- KEY_NUMPADSUBTRACT
- KEY_NUMPADADDITION

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
