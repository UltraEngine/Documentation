# Component.Save

This method is called when a component is saved to a file or copied.

## Syntax

```csharp
bool Save(Dictionary<string, object> properties)
```

| Parameter | Description |
|---|---|
| properties | component data in a dictionary object |

## Returns

Returns true if the component is successfully saved, otherwise false is returned.

## Remarks

This method can be overridden to add your own custom handling. For example, your component might need to save some extra information or write to another file. If you do so, you will probably want to call the base method without your method, to load the built-in supported data types, like so:

```csharp
bool Save(Dictionary<string, object> properties)
{
  properties["health"] = this.health;
  if (this.texture != null) properties["texture"] = this.texture.path;
  return true;
}
```

The Ultra Engine entity component system will automatically save and load the following data types:
- bool
- double
- float
- int
- string

Additionally, [Entity](Entity.md) shared pointers are supported, as long as the entity is stored in the same file.