# VrController::ButtonHit

This method gets the button hit state.

## Syntax

- bool **ButtonHit**(const VrControllerButton button)

| Parameter | Description |
|---|---|
| button | can be VRBUTTON_A, VRBUTTON_B, VRBUTTON_MENU, VRBUTTON_GRIP, VRBUTTON_SYSTEM, VRBUTTON_LEFT, VRBUTTON_UP, VRBUTTON_RIGHT, VRBUTTON_DOWN, VRBUTTON_TOUCHPAD, or VRBUTTON_TRIGGER |

## Returns

Returns true if the specified button has been pressed since the last call to this method, otherwise false is returned.
