# Entity::Attach

This method attaches an entity to a model bone or a navigation agent. This provides a way of "gluing" an entity to a non-entity object.

## Syntax

- bool **Attach**(shared_ptr<[NavAgent](NavAgent.md)> agent);
- bool **Attach**(shared_ptr<[Model](Model.md)> model, shared_ptr<[Bone](Bone.md)> bone);

| Parameter | Description |
| --- | --- |
| **model** | model to attach entity to |
| **bone** | skeleton bone to attach entity to |
| **agent** | navigation agent to attach entity to |

## Returns

Returns true if the attachment is valid, otherwise false is returned.

## Remarks

For bone attachments, the bone must belong to the skeleton the model is currently using.
