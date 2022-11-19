# GamePadButtonDown

This function detects whether a gamepad button is currently pressed.

## Syntax

- bool **GamePadButtonDown**(const GamePadButton button, const int index = 0)

| Parameter | Description |
|---|---|
| button | gamepad button ID from the list below |
| index | controller index, to support multiple gamepads |

## Returns

Returns true if the button is pressed or false if it is not.

## Remarks

The following button constants can be used:

- GAMEPADBUTTON_DPADUP
- GAMEPADBUTTON_DPADDOWN
- GAMEPADBUTTON_DPADLEFT
- GAMEPADBUTTON_DPADRIGHT
- GAMEPADBUTTON_START
- GAMEPADBUTTON_BACK
- GAMEPADBUTTON_LTHUMB
- GAMEPADBUTTON_RTHUMB
- GAMEPADBUTTON_LSHOULDER
- GAMEPADBUTTON_RSHOULDER
- GAMEPADBUTTON_X
- GAMEPADBUTTON_Y
- GAMEPADBUTTON_A
- GAMEPADBUTTON_B
