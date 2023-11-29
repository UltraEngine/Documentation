### GamePad.GetConnected

This method can be used to check if one or more game controllers are connected.

#### Syntax

```csharp
bool GetConnected()
```

#### Returns

Returns `true` if the gamepad is connected, otherwise `false` is returned.

#### Example

```csharp
if (GamePad.GetConnected())
{
    Console.WriteLine("Gamepad is connected.");
}
else
{
    Console.WriteLine("Gamepad is not connected.");
}
```