# Joint

**Base class:** [Object](Object.md)

This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

| Name | Type | Description |
|---|---|----|
| chlld | const shared_ptr<[Entity](Entity.md)\>& | Read-only child entity |
| parent | const shared_ptr<[Entity](Entity.md)\>& | Read-only parent entity |
| [GetLimits](Joint_GetLimits.md) | Method | returns the minimum and maximum joint limits |
| [GetOffset](Joint_GetOffset.md) | Method | gets the current angle of a hinge or position of a slider joint |
| [SetFriction](Joint_SetFriction.md) | Method | sets joint friction |
| [SetLimits](Joint_SetLimits.md) | Method | sets joint limites |
| [SetMaxForce](Joint_SetMaxForce.md) | Method | sets the max force of a motorized or kinematic joint |
| [SetMaxTorque](Joint_SetMaxTorque.md) | Method | sets the max torque of a motorized or kinematic joint |
| [SetPose](Joint_SetPose.md) | Method | sets the target position and/or rotation of a hinge, slider, or kinematic joint |
| [SetSpring](Joint_SetSpring.md) | Method | adds spring behavior to a hinge or slider joint |
| [CreateBallAndSocketJoint](CreateBallAndSocketJoint.md) | Function | Creates a new ball and socket joint |
| [CreateHingeJoint](CreateHingeJoint.md) | Function | Creates a new hinge joint |
| [CreateKinematicJoint](CreateKinematicJoint.md) | Function | Creates a new kinematic joint |
| [CreatePlaneJoint](CreatePlaneJoint.md) | Function | Creates a new plane joint |
| [CreateSliderJoint](CreateSliderJoint.md) | Function | Creates a new slider joint |

<br>

## Example

```csharp
using UnityEngine;
using System.Collections;

public class JointExample : MonoBehaviour
{
    public GameObject parentObject;
    public GameObject childObject;

    private Joint joint;

    private void Start()
    {
        joint = parentObject.AddComponent<Joint>();
        joint.chlld = childObject.GetComponent<Entity>();
        joint.parent = parentObject.GetComponent<Entity>();

        joint.SetLimits(0, 90);
        joint.SetMaxForce(100);
        joint.SetMaxTorque(50);

        Vector3 targetPosition = new Vector3(1, 0, 0);
        Quaternion targetRotation = Quaternion.Euler(0, 0, 90);
        joint.SetPose(targetPosition, targetRotation);

        joint.SetSpring(10, 5);
    }
}
```