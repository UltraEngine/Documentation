# GamePad.ButtonDown

This method detects whether a gamepad button is currently pressed.

## Syntax

```C#
bool ButtonDown(GamePadButton button)
```

| Parameter | Description |
|---|---|
| button | gamepad button ID from the list below |

## Returns

Returns true if the button is pressed or false if it is not.

## Remarks

The following button constants can be used:

- [GamePadButton.DpadUp](link/to/dpadup)
- [GamePadButton.DpadDown](link/to/dpaddown)
- [GamePadButton.DpadLeft](link/to/dpadleft)
- [GamePadButton.DpadRight](link/to/dpadright)
- [GamePadButton.Start](link/to/start)
- [GamePadButton.Back](link/to/back)
- [GamePadButton.LeftThumb](link/to/leftthumb)
- [GamePadButton.RightThumb](link/to/rightthumb)
- [GamePadButton.LeftShoulder](link/to/leftshoulder)
- [GamePadButton.RightShoulder](link/to/rightshoulder)
- [GamePadButton.X](link/to/x)
- [GamePadButton.Y](link/to/y)
- [GamePadButton.A](link/to/a)
- [GamePadButton.B](link/to/b)

## Example

```C#
// Check if the A button is pressed
bool isAPressed = GamePad.ButtonDown(GamePadButton.A);
if(isAPressed)
{
    // Perform action for A button being pressed
}
```