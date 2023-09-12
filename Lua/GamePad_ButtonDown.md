# GamePad.ButtonDown

This method detects whether a gamepad button is currently pressed.

## Syntax

`ButtonPressed(button: number): boolean`

## Parameters

- `button` (number): the gamepad button ID from the list below

## Returns

Returns `true` if the button is pressed or `false` if it is not.

## Remarks

The following button constants can be used:

- `GAMEPADBUTTON_DPADUP`
- `GAMEPADBUTTON_DPADDOWN`
- `GAMEPADBUTTON_DPADLEFT`
- `GAMEPADBUTTON_DPADRIGHT`
- `GAMEPADBUTTON_START`
- `GAMEPADBUTTON_BACK`
- `GAMEPADBUTTON_LTHUMB`
- `GAMEPADBUTTON_RTHUMB`
- `GAMEPADBUTTON_LSHOULDER`
- `GAMEPADBUTTON_RSHOULDER`
- `GAMEPADBUTTON_X`
- `GAMEPADBUTTON_Y`
- `GAMEPADBUTTON_A`
- `GAMEPADBUTTON_B`

Example: 
```lua
if GamePad.ButtonDown(GAMEPADBUTTON_A) then
  print("A button is pressed")
else
  print("A button is not pressed")
end
```