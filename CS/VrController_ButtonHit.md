# VrController.ButtonHit

This method gets the button hit state.

## Syntax

```csharp
bool ButtonHit(VrControllerButton button)
```

| Parameter | Description |
|---|---|
| button | can be `VRBUTTON_A`, `VRBUTTON_B`, `VRBUTTON_MENU`, `VRBUTTON_GRIP`, `VRBUTTON_SYSTEM`, `VRBUTTON_LEFT`, `VRBUTTON_UP`, `VRBUTTON_RIGHT`, `VRBUTTON_DOWN`, `VRBUTTON_TOUCHPAD`, `VRBUTTON_TRIGGER`, or any number from 0 to 63 |

## Returns

Returns `true` if the specified button has been pressed since the last call to this method, otherwise `false` is returned.

Example:

```csharp
if (VrController.ButtonHit(VrControllerButton.VRBUTTON_A))
{
    Console.WriteLine("Button A has been pressed");
}
```