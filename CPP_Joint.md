# Joint #
This class creates a physical constraint between two entities. Joints can use limits and actuators (motors) to control their range of motion and movement.

## Base Class ##
- [Object](CPP_Object.md)

## Members ##
|   |   |
|---|---|
| const shared_ptr<[Entity](CPP_Entity_32f.md)\>& **parent** | parent entity, may be NULL |
| const shared_ptr<[Entity](CPP_Entity_32f.md)\>& **child** | child entity |

## Methods ##
|   |   |
|---|---|
| GetStiffness | Retrieves the joint stiffness |

## Functions ##
|   |   |
|---|---|
| CreateHingeJoint | Creates a new hinge joint |
