# Component.Load

This method is called when a component is loaded from a file or copied.

## Syntax

```csharp
bool Load(Dictionary<string, object> properties)
```

| Parameter | Description |
|---|---|
| properties | component data in a dictionary object |

## Returns

Returns true if the component is successfully loaded, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to create extra entities to use. If you do so, you will probably want to call the base method without your method, to load the built-in supported data types, like so:

```csharp
bool Load(Dictionary<string, object> properties)
{
  this.health = (float)properties["health"];
  string path = (string)properties["texture"];
  if (!string.IsNullOrEmpty(path)) this.texture = LoadTexture(path);
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