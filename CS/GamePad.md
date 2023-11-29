# GamePad

Base class: [Object](Object.md)

Ultra Engine provides built-in support for XBox One and XBox 360 game controllers on Windows.

| Property | Type | Description |
|---|---|---|
| [ButtonDown](GamePad_ButtonDown.md) | Method | gets the button press state |
| [ButtonHit](GamePad_ButtonHit.md) | Method | gets the button hit state |
| [GetAxisPosition](GamePad_GetAxisPosition.md) | Method | gets the axis position |
| [GetConnected](GamePad_GetConnected.md) | Method | returns true as long as the game pad is connected |
| [Flush](GamePad_Flush.md) | Method | resets the game pad button hit states |
| [Rumble](GamePad_Rumble.md) | Method | controls haptic feedback |
| [GetGamePads](GetGamePads.md) | Function | gets a list of connected game pads |

## Syntax

```csharp
public class GamePad : Object
{
    public bool ButtonDown(Button button);
    
    public bool ButtonHit(Button button);
    
    public float GetAxisPosition(Axis axis);

    public bool GetConnected();
    
    public void Flush();
    
    public void Rumble(float leftMotor, float rightMotor);
    
    public List<GamePad> GetGamePads();
}
```

## Example

```csharp
// Check if the "A" button is pressed
if (GamePad.GetGamePads()[0].ButtonDown(Button.A))
{
    Console.WriteLine("The A button is pressed");
}

// Check if the "B" button is hit
if (GamePad.GetGamePads()[0].ButtonHit(Button.B))
{
    Console.WriteLine("The B button is hit");
}

// Get the position of the left stick on game pad 1
float leftStickPosition = GamePad.GetGamePads()[0].GetAxisPosition(Axis.LeftStickX);

// Check if game pad 1 is connected
bool isConnected = GamePad.GetGamePads()[0].GetConnected();

// Flush the button hit states of game pad 1
GamePad.GetGamePads()[0].Flush();

// Rumble game pad 1 with left motor at full power and right motor off
GamePad.GetGamePads()[0].Rumble(1.0f, 0.0f);

// Get a list of connected game pads
List<GamePad> connectedGamePads = GetGamePads();
```