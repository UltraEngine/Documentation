# Object

This is the base class for most types in the engine.

| Property | Type | Description |
|-|-|-|
| [As](Object_As.md) | `Type` | casts this object to another type |
| [Self](Object_Self.md) | `Type` | returns a shared pointer to this object |

```csharp
// Example
Type myType = myObject.As<Type>();
Type selfType = myObject.Self();
```