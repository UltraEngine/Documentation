# Joint

**Base class:** [Object](Object.md)

This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

## Properties

| Name | Type | Description |
|---|---|----|
| child | const shared_ptr<[Entity](Entity.md)\>& | Read-only child entity |
| parent | const shared_ptr<[Entity](Entity.md)\>& | Read-only parent entity |
| [SetLimits](Joint_SetLimits.md) | Method | sets joint limites |
| [SetMaxForce](Joint_SetMaxForce.md) | Method | sets the max force of a motorized or kinematic joint |
| [SetMaxTorque](Joint_SetMaxTorque.md) | Method | sets the max torque of a motorized or kinematic joint |
| [SetTargetPosition](Joint_SetTargetPosition.md) | Method | sets the target position of a slider or kinematic joint |
| [SetTargetRotation](Joint_SetTargetRotation.md) | Method | sets the target rotation of a hinge or kinematic joint |
| [CreateHingeJoint](CreateHingeJoint.md) | Function | Creates a new hinge joint |
| [CreateKinematicJoint](CreateKinematicJoint.md) | Function | Creates a new kinematic joint |
| [CreateSliderJoint](CreateSliderJoint.md) | Function | Creates a new slider joint |
