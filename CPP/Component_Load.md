# Component::Load

This method is called when a component is loaded from a file or copied.

## Syntax

- bool **Load**(table& properties, shared_ptr<[Stream](Stream.md)> binstream, shared_ptr<[Scene](Scene.md)> scene, const LoadFlags flags, shared_ptr<[Object](Object.md)> extra)

| Parameter | Description |
|---|---|
| properties | component data in a table object |

## Returns

Returns true if the component is successfully loaded, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to create extra entities to use. If you do so, you will probably want to call the base method without your method, to load the built-in supported data types, like so:

```c++
bool Load(const table& properties)
{
  this->health = properties["health"];
  std::string path = properties["texture"];
  if (not path.empty()) this->texture = LoadTexture(path);
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
