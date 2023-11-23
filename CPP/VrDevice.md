# VrDevice

This class handles objects that appear in both the virtual and real world, such as the VR headset and controllers.

| Property | Type | Description |
| --- | --- | --- |
| model | const shared_ptr<[Model](Model.md)\>& | 3D model representing the real object |
| [GetMatrix](Hmd_GetMatrix.md) | Method | returns the device 4x4 matrix |
| [GetPosition](Hmd_GetPosition.md) | Method | returns the device position |
| [GetRotation](Hmd_GetRotation.md) | Method | returns the device rotation |
| [GetQuaternion](Hmd_GetQuaternion.md) | Method | returns the device quaternion |
