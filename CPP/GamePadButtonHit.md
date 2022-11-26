# GamePad::ButtonHit

This function detects whether a gamepad button has been pressed since the last time it was checked.

## Syntax

- bool **ButtonHit**(const GamePadButton button, const int index = 0)

| Parameter | Description |
|---|---|
| button | gamepad button ID from the list below |

## Returns

Returns true if the button has been pressed or false if it has not.

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
