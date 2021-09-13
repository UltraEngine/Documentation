# Joint

**Base Class:** [Object](Object.md)

This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

## Properties

| Name | Type | Description |
|---|---|----|
| child | const shared_ptr<[Entity](Entity.md)\>& | Read-only child entity |
| parent | const shared_ptr<[Entity](Entity.md)\>& | Read-only parent entity |
| [GetLimits](Joint_GetLimits.md) | Method | Breaks the joint |
| [GetPosition](Joint_GetPosition.md) | Method | Breaks the joint |
| [GetRotation](Joint_GetRotation.md) | Method | Breaks the joint |
| [SetLimits](Joint_SetLimits.md) | Method | Breaks the joint |
| [SetMaxForce](Joint_SetMaxForce.md) | Method | Breaks the joint |
| [SetMaxTorque](Joint_SetMaxTorque.md) | Method | Breaks the joint |
| [SetPosition](Joint_SetPosition.md) | Method | Breaks the joint |
| [SetRotation](Joint_SetRotation.md) | Method | Breaks the joint |
| [CreateHingeJoint](CreateHingeJoint.md) | Function | Creates a new hinge joint |
| [CreateKinematicJoint](CreateKinematicJoint.md) | Function | Creates a new kinematic joint |
| [CreateSliderJoint](CreateSliderJoint.md) | Function | Creates a new slider joint |
