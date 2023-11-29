# Hmd

Base class: [VrDevice](VrDevice.md)

The Hmd (head-mounted display) class provide access to virtual reality features.

| Property | Type | Description |
| --- | --- | --- |
| controllers | const List<shared_ptr<[VrController](VrController.md)>> | left and right hand controllers |
| [SetOffset](Hmd_SetOffset.md) | Method | sets an offset position and rotation |
| [GetHmd](GetHmd.md) | Function | returns the user's head-mounted display |

## Examples

```csharp
var controllers = new List<shared_ptr<[VrController](VrController.md)>>();
// Access the left and right hand controllers
var leftController = controllers[0];
var rightController = controllers[1];

// Set offset position and rotation
Hmd.SetOffset(newOffsetPosition, newOffsetRotation);

// Get the user's head-mounted display
var hmd = GetHmd();
```