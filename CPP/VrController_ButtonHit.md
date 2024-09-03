# VrController::ButtonHit

This method gets the button hit state.

## Syntax

- bool **ButtonHit**(const VrControllerButton button)

| Parameter | Description |
|---|---|
| button | can be any of the values in the list below, or any number from 0 to 63 |

#### Generic Buttons
- VRBUTTON_A
- VRBUTTON_B
- VRBUTTON_TOUCHPAD
- VRBUTTON_TRIGGER

#### Valve Index Controller Buttons
- VRBUTTON_KNUCKLES_A (also indicates squeezed handle)
- VRBUTTON_KNUCKLES_B
- VRBUTTON_KNUCKLES_DPAD (also touchpad button)
- VRBUTTON_KNUCKLES_TRIGGER

#### HTC Vive controller
- VRBUTTON_VIVE_MENU
- VRBUTTON_VIVE_GRIP
- VRBUTTON_VIVE_TOUCHPAD
- VRBUTTON_VIVE_TRIGGER

## Returns

Returns true if the specified button has been pressed since the last call to this method, otherwise false is returned.
