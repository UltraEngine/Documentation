# VrController.ButtonDown

This method gets the current button pressed state of the controller.

## Syntax

```csharp
bool ButtonDown(VrControllerButton button)
```

| Parameter | Description |
|---|---|
| button | can be [VrControllerButton](link_here), or any number from 0 to 63 |

## Returns

Returns true if the specified button is pressed, otherwise false is returned.

### Example

```csharp
if (VrController.ButtonDown(VrControllerButton.VRBUTTON_A))
{
    // Perform action when button A is pressed
}
```