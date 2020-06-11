# Entity::Attach #
This method attaches an entity to a model bone or a navigation agent. This provides a way of "gluing" an entity to a non-entity object.

## Syntax ##
- bool **Attach**(shared_ptr<[Model](CPP_Model.md)> model, shared_ptr<[Bone](CPP_Bone.md)> bone);
- bool **Attach**(shared_ptr<[Model](CPP_Model.md)> model, const std::string& bone);
- bool **Attach**(shared_ptr<[Model](CPP_Model.md)> model, const std::wstring& bone);
- bool **Attach**(shared_ptr<[NavAgent](CPP_NavAgent.md)> agent);

### Parameters ###
| Name | Description |
| --- | --- |
| **model** | model to attach entity to |
| **bone** | skeleton bone to attach entity to |
| **agent** | navigation agent to attach entity to |

## Returns ##
Returns true if the attachment is valid, otherwise false is returned.

## Remarks ##
For bone attachments, the bone must belong to the skeleton the model is currently using.
