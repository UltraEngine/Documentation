# VrController.ButtonTouched

This method gets the button touch state.

## Syntax

```csharp
public bool ButtonTouched(VrControllerButton button)
```

| Parameter | Description |
|---|---|
| button | can be `VrControllerButton.VRBUTTON_A`, `VrControllerButton.VRBUTTON_B`, `VrControllerButton.VRBUTTON_MENU`, `VrControllerButton.VRBUTTON_GRIP`, `VrControllerButton.VRBUTTON_SYSTEM`, `VrControllerButton.VRBUTTON_LEFT`, `VrControllerButton.VRBUTTON_UP`, `VrControllerButton.VRBUTTON_RIGHT`, `VrControllerButton.VRBUTTON_DOWN`, `VrControllerButton.VRBUTTON_TOUCHPAD`, `VrControllerButton.VRBUTTON_TRIGGER`, or any number from 0 to 63 |

## Returns

Returns `true` if the specified button is touched, otherwise `false` is returned.