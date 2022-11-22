# Component::SaveState

This method is called when an actor is saved to a file or copied.

## Syntax

- bool **SaveState**([nlohmann::json](https://json.nlohmann.me/)& j3)

| Parameter | Description |
|---|---|
| j3 | component data in a JSON object |

## Returns

Returns true if the component is successfully saved, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to save some extra information or write to another file. If you do so, you will probably want to call the base method without your method, to load the built-in supported data types, like so:

```c++
bool SaveState(nlohmann::json& j3)
{
  if (!Component::SaveState(j3)) return false;
  j3["customdata"]["myvalue"] = this->customvalue;
  return true;
}
```

The Ultra Engine entity component system will automatically save and load the following data types:
- bool
- double
- dFloat
- dMat3
- dMat4
- dPlane
- dQuat
- dVec2
- dVec3
- dVec4
- float
- int
- iVec2
- iVec3
- iVec4
- Vec2
- Vec3
- Vec4
- Mat3
- Mat4
- Plane
- Quat
- String
- WString
  
Additionally, [Entity](Entity.md) shared pointers are supported, as long as the entity is stored in the same file.
