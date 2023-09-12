### Joint

**Base class:** [Object](Object.md)

This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

#### Properties:
- `Property`: (const shared_ptr<[Entity](Entity.md)\>&) - Read-only child entity
- `parent`: (const shared_ptr<[Entity](Entity.md)\>&) - Read-only parent entity

#### Methods:
- [GetLimits](Joint_GetLimits.md): Returns the minimum and maximum joint limits
- [GetOffset](Joint_GetOffset.md): Gets the current angle of a hinge or position of a slider joint
- [SetFriction](Joint_SetFriction.md): Sets joint friction
- [SetLimits](Joint_SetLimits.md): Sets joint limits
- [SetMaxForce](Joint_SetMaxForce.md): Sets the max force of a motorized or kinematic joint
- [SetMaxTorque](Joint_SetMaxTorque.md): Sets the max torque of a motorized or kinematic joint
- [SetPose](Joint_SetPose.md): Sets the target position and/or rotation of a hinge, slider, or kinematic joint
- [SetSpring](Joint_SetSpring.md): Adds spring behavior to a hinge or slider joint

#### Functions:
- [CreateBallAndSocketJoint](CreateHingeJoint.md): Creates a new ball and socket joint
- [CreateHingeJoint](CreateHingeJoint.md): Creates a new hinge joint
- [CreateKinematicJoint](CreateKinematicJoint.md): Creates a new kinematic joint
- [CreatePlaneJoint](CreatePlaneJoint.md): Creates a new plane joint
- [CreateSliderJoint](CreateSliderJoint.md): Creates a new slider joint