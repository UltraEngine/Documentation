# Joint #
This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

## Base Class ##
- [Object](CPP_Object.md)

| Property | Type | Description |
|---|---|----|
| parent | const shared_ptr<[Entity](CPP_Entity_32f.md)\>& | Read-only parent entity. |
| child | const shared_ptr<[Entity](CPP_Entity_32f.md)\>& | Read-only child entity. |
| Break | Method | Breaks the joint. |
| SetSpring | Method | Breaks the joint. |
| GetSpring | Method | Breaks the joint. |
| SetLimits | Method | Breaks the joint. |
| GetLimits | Method | Breaks the joint. |
| SetStiffness | Method | Breaks the joint. |
| GetStiffness | Method | Breaks the joint. |
| EnableLimits | Method | Breaks the joint. |
| DisableLimits | Method | Breaks the joint. |
| SetActuatorSpeed | Method | Breaks the joint. |
| SetActuatorPower | Method | Breaks the joint. |
| GetActuatorSpeed | Method | Breaks the joint. |
| SetFriction | Method | Breaks the joint. |
| GetFriction | Method | Breaks the joint. |
| CreateSliderJoint | Function | Creates a new hinge joint |
| CreateHingeJoint | Function | Creates a new hinge joint |
| CreateBallAndSocketJoint | Function | Creates a new hinge joint |
| CreateHingeJoint | Function | Creates a new hinge joint |

