# GamePad.ButtonHit

This method detects whether a gamepad button has been pressed since the last time it was checked.

## Syntax

```csharp
bool **ButtonHit**(GamePadButton button)
```

| Parameter | Description |
|---|---|
| button | gamepad button ID from the list below |

## Returns

Returns true if the button has been pressed or false if it has not.

## Remarks

The following button constants can be used:

- GamePadButton.DPadUp
- GamePadButton.DPadDown
- GamePadButton.DPadLeft
- GamePadButton.DPadRight
- GamePadButton.Start
- GamePadButton.Back
- GamePadButton.LeftThumb
- GamePadButton.RightThumb
- GamePadButton.LeftShoulder
- GamePadButton.RightShoulder
- GamePadButton.X
- GamePadButton.Y
- GamePadButton.A
- GamePadButton.B

## Example

```csharp
if (GamePad.ButtonHit(GamePadButton.A))
{
    Console.WriteLine("Button A has been pressed");
}
```