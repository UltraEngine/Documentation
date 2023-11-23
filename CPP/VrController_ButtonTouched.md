# VrController::ButtonTouched

This method gets the button touch state.

## Syntax

- bool **ButtonTouched**(const VrControllerButton button)

| Parameter | Description |
|---|---|
| button | can be VRBUTTON_A, VRBUTTON_B, VRBUTTON_MENU, VRBUTTON_GRIP, VRBUTTON_SYSTEM, VRBUTTON_LEFT, VRBUTTON_UP, VRBUTTON_RIGHT, VRBUTTON_DOWN, VRBUTTON_TOUCHPAD, VRBUTTON_TRIGGER, or any number from 0 to 63 |

## Returns

Returns true if the specified button is touched, otherwise false is returned.
