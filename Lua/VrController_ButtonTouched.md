# VrController:ButtonTouched

This method gets the current button pressed state of the controller.

## Syntax

- boolean **ButtonTouched**(number button)

| Parameter | Description |
|---|---|
| button | can be any of the values in the list below, or any number from 1 to 64 |

#### Generic Buttons
- VRBUTTON_A
- VRBUTTON_B
- VRBUTTON_TOUCHPAD
- VRBUTTON_TRIGGER

#### Valve Index Controller Buttons
- VRBUTTON_INDEX_A (also indicates squeezed handle)
- VRBUTTON_INDEX_B
- VRBUTTON_INDEX_DPAD (also touchpad button)
- VRBUTTON_INDEX_TRIGGER

#### HTC Vive controller
- VRBUTTON_VIVE_MENU
- VRBUTTON_VIVE_GRIP
- VRBUTTON_VIVE_TOUCHPAD
- VRBUTTON_VIVE_TRIGGER

## Returns

Returns true if the specified button is pressed, otherwise false is returned.
