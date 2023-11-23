# VrDevice

This class handles objects that appear in both the virtual and real world, such as the VR headset and controllers. You can use the [Entity::Attach](Entity_Attach.md) method to attach an object to a VR device.

| Property | Type | Description |
| --- | --- | --- |
| model | const shared_ptr<[Model](Model.md)\>& | 3D model representing the real object |
| [Connected](VrDevice_Connected.md) | Method | returns true if the device is connected |
| [GetMatrix](VrDevice_GetMatrix.md) | Method | returns the device 4x4 matrix |
| [GetPosition](VrDevice_GetPosition.md) | Method | returns the device position |
| [GetQuaternion](VrDevice_GetQuaternion.md) | Method | returns the device quaternion |
| [GetRotation](VrDevice_GetRotation.md) | Method | returns the device rotation |
